import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class PassCode extends StatefulWidget {
  static const String id = 'passCode_screen';
  @override
  _PassCodeState createState() => _PassCodeState();
}

class _PassCodeState extends State<PassCode> {
  GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(),
    );
  }
}
