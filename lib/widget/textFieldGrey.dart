import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextfieldGray extends StatelessWidget {
  TextfieldGray({
    this.hintText = 'Username',
    this.isobscure = false,
    this.onChange,
    this.letterSpacing,
    this.fontWeight,
    this.width = 1,
    this.textEditingController,
    this.isAutoFocus = false,
    this.textInputType = TextInputType.text,
  });
  final String hintText;
  final bool isobscure;
  final Function onChange;
  final double letterSpacing;
  final FontWeight fontWeight;
  final int width;
  final TextEditingController textEditingController;
  final bool isAutoFocus;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return Container(
      width: width.wp,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: Color(0xffF4F5F7),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Center(
          child: TextField(
            keyboardType: textInputType,
            cursorColor: Color(0xffFDDB3A),
            obscureText: isobscure,
            style: TextStyle(
                color: Color(0xffB4B3B3),
                fontSize: 20.sp,
                fontFamily: 'brlns',
                letterSpacing: letterSpacing,
                fontWeight: fontWeight),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Color(0xffB4B3B3),
                  fontSize: 20.sp,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w300),
              // suffixIcon: Icon(Icons.remove_red_eye),
            ),
            onChanged: onChange,
            controller: textEditingController,
            autofocus: isAutoFocus,
          ),
        ),
      ),
    );
  }
}
