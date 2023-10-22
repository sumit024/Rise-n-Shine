import 'package:feeds/constants/route_names.dart';
import 'package:flutter/material.dart';

import '../helper/custom_widgets.dart';
import '../helper/feed_item.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  late double height;
  late double width;

  @override
  void didChangeDependencies() {
    height =
        MediaQuery.sizeOf(context).height - MediaQuery.paddingOf(context).top;
    width = MediaQuery.sizeOf(context).width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Image.asset(
                  "assets/images/feed_top_pg.png",
                  height: kToolbarHeight,
                  fit: BoxFit.fill,
                  width: width,
                ),
                Positioned(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context, homeScreen, (route) => false);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                      getText(data: 'Logo', color: Colors.white, fontSize: 20),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context,postFeedScreen);
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return   FeedItem(
                        assetPath: "assets/images/speaker.png",
                        postPath: "assets/images/post1.png",
                        name: 'Sumit Kushwaha',
                        time: '3 hours',
                        caption: 'Plantation activity made fun',
                        numLikes: 70,
                        numComments: 69);
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
