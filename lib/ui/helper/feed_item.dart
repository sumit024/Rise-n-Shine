import 'package:feeds/constants/route_names.dart';
import 'package:feeds/ui/helper/custom_widgets.dart';
import 'package:flutter/material.dart';

class FeedItem extends StatefulWidget {
  final String assetPath;
  final String name;
  final String time;
  final String caption;
   int numLikes;
  final String postPath;
   int numComments;

   FeedItem(
      {Key? key,
      required this.assetPath,
      required this.postPath,
      required this.name,
      required this.time,
      required this.caption,
      required this.numLikes,
      required this.numComments})
      : super(key: key);

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  late double height;
  late double width;

  @override
  void didChangeDependencies() {
    height =
        MediaQuery.sizeOf(context).height - MediaQuery.paddingOf(context).top;
    width = MediaQuery.sizeOf(context).width;
    super.didChangeDependencies();
  }

  bool isLiked=false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 20,
              child: Image.asset(widget.assetPath),
            ),
            title: getText(
                data: widget.name,
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            subtitle: getText(
              data: 'Posted ${widget.time} ago',
              fontSize: 13,
              color: Colors.amber,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              widget.postPath,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked=!isLiked;
                      if(isLiked){
                        widget.numLikes++;
                      }else{
                        widget.numLikes--;
                      }
                    });
                  },
                  child: Image.asset(
                    isLiked?'assets/images/like_active.png':'assets/images/like_inactive.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 5),
                getText(
                    data: '${widget.numLikes}',
                    fontSize: 14,
                    color: Colors.black),
                const Spacer(),
                getText(
                    data: '${widget.numComments}',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, commentsScreen);
                  },
                  child: Image.asset(
                    "assets/images/comment.png",
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
          ),
          getText(data: '${widget.caption}', fontSize: 16, color: Colors.black),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
