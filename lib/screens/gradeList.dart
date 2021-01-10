import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kassim/widget/monthButton.dart';
import '../widget/CustomAppBar.dart';
import './addStudent.dart';
import '../utils/constant.dart';
import '../models/student.dart';
import '../data/databaseHelper.dart';
import '../widget/editStudent.dart';
import 'dart:async';

class GradeList extends StatefulWidget {
  static const String id = 'gradeList_Screen';
  @override
  _GradeListState createState() => _GradeListState();
  GradeList({this.gradeTitle = 'First Grade'});
  final String gradeTitle;
}

class _GradeListState extends State<GradeList> {
  DbHelper helper;
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  refreshOnBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: widget.gradeTitle,
        leadingIconData: 'images/icons/back_ios.png',
        leadingOnTap: () => Navigator.pop(context),
        actionIconData: 'images/icons/2dots.png',
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder(
            future: helper.allStudents(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //TODO Fix If the Snapshot have no Students And show no student Box
              if (!snapshot.hasData) {
                //If there are no students show Empty Icon with no student text
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inbox,
                        size: 120,
                        color: Colors.grey.withOpacity(.8),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'No Students Yet',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.withOpacity(.8),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                //If there are students show List of the students
                return Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
                  child: ListView.separated(

                      //The Space Between Each Student Item
                      separatorBuilder: (ctxt, index) {
                        return Container(
                          height: 15,
                        );
                      },
                      itemCount: snapshot.data.length,

                      //The Student Item
                      itemBuilder: (context, index) {
                        Student student = Student.fromMap(snapshot.data[index]);

                        List monthCheck = [
                          student.month1,
                          student.month2,
                          student.month3,
                          student.month4,
                          student.month5,
                          student.month6,
                          student.month7,
                          student.month8,
                          student.month9,
                          student.month10,
                          student.month11,
                          student.month12,
                          student.note1,
                          student.note2,
                        ];
                        //TODO Fix Student item to show as planned
                        //Gesture Detector : on Tap edit the student month : on long press delete him
                        return GestureDetector(
                          //TODO FIX MEEEE PLEASE
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF4F5F7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.w)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 15.h),
                              child: Text(
                                student.studentName,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),

                          onTap: () => showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25)),
                              ),
                              context: context,
                              builder: (context) {
                                ScreenUtil.init(context,
                                    designSize: Size(375, 817),
                                    allowFontScaling: true);

                                return SingleChildScrollView(
                                    child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      25.w, 10.h, 25.w, 20.h),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 10.h),
                                        child: Container(
                                          width: 60.w,
                                          height: 6.h,
                                          decoration: BoxDecoration(
                                              color: Color(0xff201D2E),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 10.w),
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
                                            IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              AddStudent(
                                                                student:
                                                                    student,
                                                              ))).then(
                                                      refreshOnBack);
                                                })
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20.h),
                                        child: Wrap(
                                          runSpacing: 15.h,
                                          spacing: 15.h,
                                          children: List.generate(10, (index) {
                                            return MonthButton(
                                                index: index,
                                                listCheck: monthCheck);
                                          }),
                                        ),
                                      ),
                                      MainButtonYellow(
                                          title: 'Save',
                                          onPressed: () async {
                                            setState(() async {
                                              Student student2 = Student({
                                                'studentId': student.studentId,
                                                'studentName':
                                                    student.studentName,
                                                'studentPhone':
                                                    student.studentPhone,
                                                'studentCity':
                                                    student.studentCity,
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
                                                'month11': monthCheck[10],
                                                'month12': monthCheck[11],
                                                'note1': monthCheck[12],
                                                'note2': monthCheck[13],
                                              });
                                              await helper
                                                  .updateStudent(student2);
                                              Navigator.of(context).pop();
                                            });
                                          })
                                    ],
                                  ),
                                ));
                              }),
                          onLongPress: () => deleteModelButtomSheet(student),
                        );
                      }),
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AddStudent()))
              .then(refreshOnBack);
        },
        child: Image.asset('images/icons/plus_small.png'),
        backgroundColor: kMainColorTheam,
      ),
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
                                onPressed: () {
                                  setState(() {
                                    helper.deleteStudent(student.studentId);
                                    Navigator.of(context).pop();
                                  });
                                },
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
