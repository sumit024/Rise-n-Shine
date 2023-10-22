import 'package:feeds/ui/helper/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
class PostFeedScreen extends StatefulWidget {
  const PostFeedScreen({Key? key}) : super(key: key);

  @override
  State<PostFeedScreen> createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends State<PostFeedScreen> {
  late double height;
  late double width;

  final TextEditingController _captionController = TextEditingController();
  final ImagePicker _picker= ImagePicker();
  File? selectedImage;
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
          child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      )),
                  Icon(
                    Icons.done,
                    color: Colors.green,
                  )
                ],
              ),
              getElevatedContainer(
                  width: width,
                  child: getTextField(
                      controller: _captionController,
                      hint: 'Write Something',
                      fillColor: Colors.white,
                      maxLines: 4)),
              const SizedBox(height: 20,),
              if(selectedImage!=null) ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(selectedImage!,width: width,height: height*0.3,fit: BoxFit.cover,)
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: ()async{
                  final XFile? _file= await _picker.pickImage(source: ImageSource.gallery);
                  if(_file!=null){
                    setState(() {
                      selectedImage=File(_file.path);
                    });
                  }
                },
                  child: getButton(text: 'Add Image', width: width*0.3))
            ],
          ),
        ),
      )),
    );
  }
}
