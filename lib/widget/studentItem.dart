import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kassim/data/databaseHelper.dart';
import '../widget/mainYellowBtn.dart';
import 'package:kassim/widget/monthButton.dart';
import '../models/student.dart';

class StudentItem extends StatefulWidget {
  StudentItem({
    this.student,
    this.helper,
    this.gradeNumber,
    this.onDelete,
  });

  final Student student;
  final DbHelper helper;
  final int gradeNumber;
  final Function onDelete;
  @override
  _StudentItemState createState() => _StudentItemState();
}

class _StudentItemState extends State<StudentItem> {
  refreshOnBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List monthCheck = [
      widget.student.month1,
      widget.student.month2,
      widget.student.month3,
      widget.student.month4,
      widget.student.month5,
      widget.student.month6,
      widget.student.month7,
      widget.student.month8,
      widget.student.month9,
      widget.student.month10,
      // widget.student.month11,
      // widget.student.month12,
      widget.student.note1,
      widget.student.note2,
    ];

    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return GestureDetector(
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: Color(0xffF4F5F7),
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Text(
            widget.student.studentName,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
      onTap: () => showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          context: context,
          builder: (context) {
            ScreenUtil.init(context,
                designSize: Size(375, 817), allowFontScaling: true);

            return SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.fromLTRB(25.w, 10.h, 25.w, 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Container(
                      width: 60.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          color: Color(0xff201D2E),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: Row(
                      children: [
                        Text(
                          // student.studentName,
                          'Month',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Wrap(
                      runSpacing: 15.h,
                      spacing: 15.h,
                      children: List.generate(12, (index) {
                        return MonthButton(
                          index: index,
                          listCheck: monthCheck,
                          isNote: index > 9,
                        );
                      }),
                    ),
                  ),
                  MainButtonYellow(
                    title: 'Save',
                    onPressed: () async {
                      setState(() async {
                        Student student2 = Student({
                          'studentId': widget.student.studentId,
                          'studentName': widget.student.studentName,
                          'studentPhone': widget.student.studentPhone,
                          'studentCity': widget.student.studentCity,
                          'studentGrade': widget.gradeNumber,
                          'month1': monthCheck[0],
                          'month2': monthCheck[1],
                          'month3': monthCheck[2],
                          'month4': monthCheck[3],
                          'month5': monthCheck[4],
                          'month6': monthCheck[5],
                          'month7': monthCheck[6],
                          'month8': monthCheck[7],
                          'month9': monthCheck[8],
                          'month10': monthCheck[9],
                          'month11': 0,
                          'month12': 0,
                          'note1': monthCheck[10],
                          'note2': monthCheck[11],
                        });
                        await widget.helper.updateStudent(student2);
                        Navigator.of(context).pop();
                      });
                      refreshOnBack(null);
                    },
                  )
                ],
              ),
            ));
          }),
      onLongPress: () => deleteModelButtomSheet(widget.student),
    );
  }

  void deleteModelButtomSheet(Student student) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          ScreenUtil.init(context,
              designSize: Size(375, 817), allowFontScaling: true);
          return SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 30.h),
            child: Container(
              height: 180.h,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text('Are you sure to delete',
                        style: TextStyle(
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp)),
                    Text(student.studentName,
                        style: TextStyle(
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp)),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.white, Colors.white],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.w)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 5), // changes position of shadow
                                ),
                              ],
                            ),
                            child: ButtonTheme(
                              minWidth: 150.w,
                              height: 50.h,
                              child: FlatButton(
                                color: Colors.transparent,
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text(
                                  'NO',
                                  style: TextStyle(
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Color(0xff232031),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff201D2E), Color(0xff6A6873)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.w)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ButtonTheme(
                              minWidth: 150.w,
                              height: 50.h,
                              child: FlatButton(
                                color: Colors.transparent,
                                onPressed: widget.onDelete,
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ));
        });
  }
}
