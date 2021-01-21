import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/monthButton.dart';
import '../widget/mainYellowBtn.dart';
import '../widget/textFieldGrey.dart';
import '../models/student.dart';
import '../data/databaseHelper.dart';

class AddStudent extends StatefulWidget {
  static const String id = 'add_student_screen';
  @override
  AddStudentState createState() => AddStudentState();
  AddStudent({this.student, this.gradeNumber});
  final Student student;
  final int gradeNumber;
}

class AddStudentState extends State<AddStudent> {
  final _teName = TextEditingController();
  final _tePhone = TextEditingController();
  String _appBarTitle = 'Add New Student';
  String _buttonTitle = 'Add';

  DbHelper _helper;
  List _listCheck = [];

  @override
  void initState() {
    super.initState();
    _helper = DbHelper();
    if (widget.student != null) {
      _appBarTitle = 'Edit Student';
      _buttonTitle = 'Edit';
      _teName.text = widget.student.studentName;
      _tePhone.text = (widget.student.studentPhone).toString();
    }
  }

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
            _appBarTitle,
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.w, 50.h, 30.w, 30.h),
        child: Column(
          children: [
            Column(
              children: [
                TextfieldGray(
                  hintText: 'Name',
                  textEditingController: _teName,
                ),
                SizedBox(height: 30),
                TextfieldGray(
                  hintText: 'Phone',
                  textEditingController: _tePhone,
                ),
              ],
            ),
            SizedBox(height: 30),
            Wrap(
                runSpacing: 15.h,
                spacing: 15.h,
                children: widget.student == null
                    ? List.generate(12, (index) {
                        _listCheck.add(0);
                        return MonthButton(
                          index: index,
                          listCheck: _listCheck,
                          isNote: index > 9,
                        );
                      })
                    : []),
            Expanded(
                child: SizedBox(
              height: 20,
            )),
            MainButtonYellow(
                title: _buttonTitle,
                onPressed: () async {
                  if (widget.student == null) {
                    Student student = Student({
                      'studentName': _teName.text,
                      'studentPhone': int.parse(_tePhone.text),
                      'studentCity': 'Badaway',
                      'studentGrade': widget.gradeNumber,
                      'month1': _listCheck[0],
                      'month2': _listCheck[1],
                      'month3': _listCheck[2],
                      'month4': _listCheck[3],
                      'month5': _listCheck[4],
                      'month6': _listCheck[5],
                      'month7': _listCheck[6],
                      'month8': _listCheck[7],
                      'month9': _listCheck[8],
                      'month10': _listCheck[9],
                      'month11': 0,
                      'month12': 1,
                      'note1': _listCheck[10],
                      'note2': _listCheck[11],
                    });
                    await _helper.newStudent(student);
                  } else {
                    Student student = Student({
                      'studentId': widget.student.studentId,
                      'studentName': _teName.text,
                      'studentPhone': int.parse(_tePhone.text),
                      'studentCity': widget.student.studentCity,
                      'studentGrade': widget.gradeNumber,
                      'month1': widget.student.month1,
                      'month2': widget.student.month2,
                      'month3': widget.student.month3,
                      'month4': widget.student.month4,
                      'month5': widget.student.month5,
                      'month6': widget.student.month6,
                      'month7': widget.student.month7,
                      'month8': widget.student.month8,
                      'month9': widget.student.month9,
                      'month10': widget.student.month10,
                      'month11': widget.student.month11,
                      'month12': widget.student.month12,
                      'note1': widget.student.note1,
                      'note2': widget.student.note2,
                    });
                    await _helper.updateStudent(student);
                  }
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
