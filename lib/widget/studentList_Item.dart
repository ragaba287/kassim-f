import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/studentData.dart';

class ListItem extends StatelessWidget {
  final int index;
  final Function nameButton;
  final Function deleteButton;
  final Function editButton;
  ListItem({
    this.index,
    this.nameButton,
    this.deleteButton,
    this.editButton,
  });
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return GestureDetector(
      onTap: editButton,
      onLongPress: deleteButton,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: Color(0xffF4F5F7),
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Text(
            studentNames[index],
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class MonthDot extends StatelessWidget {
  MonthDot(this.isPaid);
  final bool isPaid;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.w,
      width: 10.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isPaid ? Color(0xff201D2E) : Colors.transparent,
          border: Border.all(color: Color(0xff201D2E))),
    );
  }
}
