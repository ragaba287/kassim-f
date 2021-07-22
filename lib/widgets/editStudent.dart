import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kassim/data/databaseHelper.dart';
import '../models/student.dart';
import '../widgets/mainYellowBtn.dart';

// ignore: must_be_immutable
class EditStudent extends StatefulWidget {
  @override
  _EditStudentState createState() => _EditStudentState();
  EditStudent({this.student, this.helper});
  Student student;
  DbHelper helper;
  List<int> monthCheck;
  bool monthBool = true;
}

class _EditStudentState extends State<EditStudent> {
  @override
  void initState() {
    super.initState();
    print(widget.student.studentId);
  }

  @override
  Widget build(BuildContext context) {
    widget.monthCheck = [
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
      widget.student.month11,
      widget.student.month12,
      widget.student.note1,
      widget.student.note2,
    ];
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
              return InkWell(
                onTap: () async {
                  setState(() async {
                    Student student = Student({
                      'studentId': 24,
                      'studentName': 'ahmed',
                      'studentPhone': 010,
                      'studentCity': 'city',
                      'month1': 0,
                      'month2': 0,
                      'month3': 0,
                      'month4': 0,
                      'month5': 0,
                      'month6': 0,
                      'month7': 0,
                      'month8': 0,
                      'month9': 0,
                      'month10': 0,
                      'month11': 0,
                      'month12': 0,
                      'note1': 0,
                      'note2': 0,
                    });
                    await widget.helper.updateStudent(student);
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
                    color: widget.monthCheck[i] == 1
                        ? Color(0xff201D2E)
                        : Colors.white,
                    border: Border.all(
                      color: Color(0xff201D2E),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text(
                    (i + 1).toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: widget.monthCheck[i] == 1
                            ? Colors.white
                            : Colors.black),
                  )),
                ),
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: MainButtonYellow(
                title: 'Save',
                onPressed: () async {
                  Student student = Student({
                    'studentId': 24,
                    'studentName': 'ahmed',
                    'studentPhone': 010,
                    'studentCity': 'city',
                    'month1': 0,
                    'month2': 0,
                    'month3': 0,
                    'month4': 0,
                    'month5': 0,
                    'month6': 0,
                    'month7': 0,
                    'month8': 0,
                    'month9': 0,
                    'month10': 0,
                    'month11': 0,
                    'month12': 0,
                    'note1': 0,
                    'note2': 0,
                  });
                  await widget.helper.updateStudent(student);
                  Navigator.of(context).pop();
                }),
          )
        ],
      ),
    );
  }
}
