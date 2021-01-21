import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/CustomAppBar.dart';
import './addStudent.dart';
import '../utils/constant.dart';
import '../models/student.dart';
import '../data/databaseHelper.dart';
import '../widget/studentItem.dart';

class GradeList extends StatefulWidget {
  static const String id = 'gradeList_Screen';
  @override
  _GradeListState createState() => _GradeListState();
  GradeList({this.gradeNumber = 1});
  final int gradeNumber;
}

class _GradeListState extends State<GradeList> {
  DbHelper helper;
  String title;
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
    if (widget.gradeNumber == 1) {
      title = 'First Grade';
    } else if (widget.gradeNumber == 2) {
      title = 'Second Grade';
    } else if (widget.gradeNumber == 3) {
      title = 'Third Grade';
    } else {
      title = 'Private';
    }
  }

  refreshOnBack(dynamic value) => setState(() {});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: title,
        leadingIconData: 'images/icons/back_ios.png',
        leadingOnTap: () => Navigator.pop(context),
        actionIconData: 'images/icons/2dots.png',
      ),
      body: FutureBuilder(
          future: helper.allStudents(widget.gradeNumber),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              //Loding progress indicator
              return Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0x80FDDB3A)),
                  backgroundColor: Colors.white,
                ),
              );
            } else if (snapshot?.data?.isEmpty ?? true) {
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
            }
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
                    return StudentItem(
                      student: student,
                      helper: helper,
                      gradeNumber: widget.gradeNumber,
                      onDelete: () => setState(() {
                        helper.deleteStudent(student.studentId);
                        Navigator.of(context).pop();
                      }),
                    );
                  }),
            );
          }),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: kMainColorTheam,
        child: Image.asset('images/icons/plus_small.png'),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => AddStudent(
                      gradeNumber: widget.gradeNumber,
                    ))).then(refreshOnBack),
      ),
    );
  }
}
