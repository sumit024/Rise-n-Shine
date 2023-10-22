import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget getElevatedContainer(
    { required double width, required Widget child}) {
  return Card(
    elevation: 20,
    child: Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: child,
    ),
  );
}

Widget getTextField(
    {required TextEditingController controller,
    required String hint,
      List<TextInputFormatter>? inputFormatters,
      int? maxLength,
      Color? fillColor,
      int? maxLines,
      double? radius,
    TextInputType? textInputType, bool? isObscuring}) {
  return Container(
    child: TextField(
      controller: controller,
      obscureText: isObscuring??false,
      keyboardType: textInputType ?? TextInputType.text,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      maxLines: maxLines??1,
      decoration: InputDecoration(
        filled: true,
          fillColor: fillColor??Colors.grey.shade200,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius??10)),
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(radius??10)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(radius??10)),
          disabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(radius??10)),
          contentPadding: EdgeInsets.all(8)),
    ),
  );
}

Widget getButton({required String text, required double width}){
  return Container(
    height: 40,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      gradient: LinearGradient(colors: [
        Color(0xffff33cc),
        Color(0xff9900ff)
      ]),
    ),
    child: Center(child: Text(text,style: TextStyle(color: Colors.white),)),
  );
}

showFlushBar({required BuildContext context, required String title, required String message}) async {
  Flushbar(
    title: title,
    titleColor: Colors.white,
    message: message,
    duration: const Duration(seconds: 2),
    flushbarPosition: FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticInOut,
    backgroundColor: const Color(0xff376c93),

  )..show(context);
}

Widget getText({required String data, required double fontSize,required Color color, FontWeight? fontWeight}){
  return Text(data,style: TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight
  ),);
}
