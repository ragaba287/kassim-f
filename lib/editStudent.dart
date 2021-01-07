import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './utils/constant.dart';
import './widget/monthButton.dart';

class EditStudent extends StatefulWidget {
  static const String id = 'editStudent_screen';
  @override
  _EditStudentState createState() => _EditStudentState();
}

bool col = false;

class _EditStudentState extends State<EditStudent> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 30.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Container(
              width: 60.w,
              height: 6.h,
              decoration: BoxDecoration(
                  color: Color(0xff201D2E),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Wrap(
            runSpacing: 15.h,
            spacing: 15.h,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(10, (i) {
              return MonthButton(monthNum: i + 1);
            }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: MainButtonYellow(
                title: 'Add',
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          )
        ],
      ),
    );
  }
}
