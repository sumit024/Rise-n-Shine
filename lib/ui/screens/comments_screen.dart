import 'package:flutter/material.dart';

import '../helper/custom_widgets.dart';
///
class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late double height;
  late double width;
  final TextEditingController _commentController= TextEditingController();

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
      body: SafeArea(child: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Column(
                children: [
                  ListTile(
                    tileColor: Colors.deepPurpleAccent,

                    leading: CircleAvatar(
                      radius: 20,
                      child: Image.asset("assets/images/speaker.png"),
                    ),
                    title: getText(
                        data: 'Sumit Kushwaha'.toUpperCase(),
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    trailing: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.cancel,color: Colors.white,)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/post1.png",width: width,height: height*0.25,fit: BoxFit.cover,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/like_active.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(width: 5),
                                getText(
                                    data: '70',
                                    fontSize: 14,
                                    color: Colors.black),
                                const Spacer(),
                                getText(
                                    data: '2',
                                    fontSize: 14,
                                    color: Colors.black),
                                const SizedBox(width: 5),
                                Image.asset(
                                  "assets/images/comment.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            getText(data: 'Plantation activity made fun', fontSize: 16, color: Colors.black),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      getCommentTile(),
                      getCommentTile(),
                    ],
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                  child: Container(
                    width: width,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey,width: 1)),
                ),
                    child: Row(
                      children: [
                        Expanded(child: getTextField(controller: _commentController,radius: 25, hint: 'Write a comment')),
                        const SizedBox(width: 10,),
                        Image.asset("assets/images/send.png",height: 30,width: 40,)
                      ],
                    )
              ))
            ],
          ),
        ),
      )),
    );
  }

  Widget getCommentTile(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            child: Image.asset("assets/images/comment_avatar.png"),
          ),
          const SizedBox(width: 6,),
          Expanded(child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepPurpleAccent.withOpacity(0.2)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getText(data: 'Shivani', fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),
                const SizedBox(height: 5,),
                getText(data: 'This was best activity for me. Good team environment', fontSize: 12, color: Colors.black,),

              ],
            ),
          ))
        ],
      ),
    );
  }
}
