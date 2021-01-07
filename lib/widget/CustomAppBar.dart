import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomAppBar extends PreferredSize {
  GlobalKey<ScaffoldState> scaffoldKey;
  String title;
  String leadingIconData;
  Function leadingOnTap;
  String actionIconData;
  Function actionOnTap;
  IconData leadingicon;

  CustomAppBar(
      {this.scaffoldKey,
      this.title = '',
      this.leadingIconData = '',
      this.leadingicon,
      // ignore: avoid_init_to_null
      this.leadingOnTap = null,
      this.actionIconData = '',
      // ignore: avoid_init_to_null
      this.actionOnTap = null});
  Size get preferredSize => Size.fromHeight(75.w);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return Container(
      // color: Colors.white.withOpacity(.8),
      height: preferredSize.height,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.w, top: 50.h),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.all(5.h),
                  child: leadingIconData.isNotEmpty
                      ? Image.asset(leadingIconData)
                      : Icon(
                          leadingicon,
                          color: Colors.black,
                        ),
                ),
                onTap: leadingOnTap,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 25.w, top: 50.h),
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.all(5.h),
                child: InkWell(
                  child: actionIconData.isNotEmpty
                      ? Image.asset(actionIconData)
                      : Container(),
                  onTap: actionOnTap,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
