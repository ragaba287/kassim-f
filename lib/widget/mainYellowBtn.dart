import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kassim/utils/constant.dart';

class MainButtonYellow extends StatefulWidget {
  MainButtonYellow({@required this.onPressed, this.title = 'Button'});
  final Function onPressed;
  final String title;

  @override
  _MainButtonYellowState createState() => _MainButtonYellowState();
}

class _MainButtonYellowState extends State<MainButtonYellow> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(817, 375), allowFontScaling: true);

    return ButtonTheme(
      minWidth: 1.wp,
      height: 35.h,
      child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: widget.onPressed,
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 50.sp,
              letterSpacing: 2,
              fontFamily: 'brlns',
            ),
          ),
          color: kMainColorTheam),
    );
  }
}
