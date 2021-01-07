import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './utils/constant.dart';
import './gradeList.dart';
import './utils/studentData.dart';
import './widget/textFieldGrey.dart';

class AddStudent extends StatefulWidget {
  static const String id = 'add_student_screen';
  @override
  AddStudentState createState() => AddStudentState();
}

class AddStudentState extends State<AddStudent> {
  String studentName;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            'Add Student',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0, top: 30),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, color: Colors.black, size: 29)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 50),
            child: Column(
              children: [
                TextfieldGray(
                  hintText: 'Name',
                  onChange: (text) {
                    studentName = text;
                  },
                ),
                SizedBox(height: 30),
                TextfieldGray(
                  hintText: 'Phone',
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Wrap(children: [
            MonthContainer(month: 1),
            MonthContainer(month: 2),
            MonthContainer(month: 3),
            MonthContainer(month: 4),
            MonthContainer(month: 5),
            MonthContainer(month: 6),
            MonthContainer(month: 7),
            MonthContainer(month: 8),
            MonthContainer(month: 9),
            MonthContainer(month: 10),
          ]),
          Expanded(
              child: SizedBox(
            height: 20,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
            child: MainButtonYellow(
                title: 'Add',
                onPressed: () {
                  studentNames.add(studentName);
                  // Navigator.of(context).pop();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => GradeList()));
                }),
          )
        ],
      ),
    );
  }
}

class MonthContainer extends StatefulWidget {
  MonthContainer({@required this.month});
  final int month;
  @override
  _MonthContainerState createState() => _MonthContainerState();
}

class _MonthContainerState extends State<MonthContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.h),
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
          color: Colors.white,
          border: Border.all(
            color: Color(0xff201D2E),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          widget.month.toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
