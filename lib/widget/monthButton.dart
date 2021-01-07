import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthButton extends StatefulWidget {
  MonthButton({this.monthNum = 0});
  final int monthNum;
  @override
  _MonthButtonState createState() => _MonthButtonState();
}

class _MonthButtonState extends State<MonthButton> {
  bool col = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);
    return InkWell(
      onTap: () {
        setState(() {
          col = !col;
        });
      },
      child: Container(
        width: 50.w,
        height: 50.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xff201D2E).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
          color: col ? Color(0xff201D2E) : Colors.white,
          border: Border.all(
            color: Color(0xff201D2E),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          widget.monthNum.toString(),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: col ? Colors.white : Colors.black),
        )),
      ),
    );
  }
}
