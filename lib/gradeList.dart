import 'package:flutter/material.dart';
import 'package:kassim/models/student.dart';
import 'package:kassim/widget/CustomAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './addStudent.dart';
import './utils/constant.dart';
import './utils/studentData.dart';
import './models/student.dart';
import './data/databaseHelper.dart';
import './editStudent.dart';

class GradeList extends StatefulWidget {
  static const String id = 'gradeList_Screen';
  @override
  _GradeListState createState() => _GradeListState();
}

class _GradeListState extends State<GradeList> {
  DbHelper helper;
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'First Grade',
        leadingIconData: 'images/icons/back_ios.png',
        leadingOnTap: () => Navigator.pop(context),
        actionIconData: 'images/icons/2dots.png',
      ),
      body: FutureBuilder(
          future: helper.allStudents(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
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
              return Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
                child: ListView.separated(
                    separatorBuilder: (ctxt, index) {
                      return Container(
                        height: 15,
                      );
                    },
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Student student = Student.fromMap(snapshot.data[index]);

                      return GestureDetector(
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
                            isScrollControlled: true,
                            builder: (_) =>
                                SingleChildScrollView(child: EditStudent())),
                        onLongPress: () =>
                            deleteModelButtomSheet(context, index),
                      );
                    }),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () async {
          setState(() async {
            print('hi');
            Student student = Student({
              'studentName': 'First Student',
              'studentPhone': 010,
              'studentCity': 'Badaway',
              'month1': 1,
              'month2': 0,
              'month3': 0,
              'month4': 1,
              'month5': 0,
              'month6': 1,
              'month7': 0,
              'month8': 1,
              'month9': 1,
              'month10': 1,
              'month11': 1,
              'month12': 1,
              'note1': 1,
              'note2': 1,
            });
            await helper.newStudent(student);
            print(student.studentName);
            print(student.studentPhone.toString());
            print(student.studentCity);
            print(student.month1);
          });
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => AddStudent()));
        },
        child: Image.asset('images/icons/plus_small.png'),
        backgroundColor: kMainColorTheam,
      ),
    );
  }

  void deleteModelButtomSheet(BuildContext context, int index) {
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
                    Text(studentNames[index].toString(),
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
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).pop();
                                    studentNames.removeAt(index);
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
