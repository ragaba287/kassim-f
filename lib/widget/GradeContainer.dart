import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradeContainer extends StatelessWidget {
  GradeContainer(
      {this.gradeNum = '1',
      this.gradePrice = 0,
      this.gradeCount = 0,
      this.press,
      this.gradeColor = Colors.amber});

  final String gradeNum;
  final int gradePrice;
  final int gradeCount;
  final Function press;
  final Color gradeColor;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.w),
        child: Container(
          width: double.infinity,
          height: 140.h,
          decoration: BoxDecoration(
            color: Color(0xff201D2E),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    gradeNum,
                    style: TextStyle(
                        color: gradeColor,
                        fontSize: 60.sp,
                        fontFamily: 'hpSimplified',
                        fontWeight: FontWeight.w900),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            gradePrice.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'hpSimplified'),
                          ),
                          Text(
                            ' E£            ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'hpSimplified'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: <Widget>[
                          Text(
                            gradeCount.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'hpSimplified'),
                          ),
                          Text(
                            '  Student',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'hpSimplified'),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
