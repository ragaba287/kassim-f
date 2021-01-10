import 'package:flutter/material.dart';
import 'package:kassim/utils/constant.dart';
import 'package:kassim/widget/CustomAppBar.dart';
import 'package:kassim/widget/textFieldGrey.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordScreen extends StatefulWidget {
  static const String id = 'password_screen';

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _teuserName = TextEditingController();
  final _tepassword = TextEditingController();
  final _tepasscode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Change Password',
        leadingicon: Icons.arrow_back_ios,
        leadingOnTap: () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(35.w),
          child: Column(
            children: [
              TextfieldGray(
                textEditingController: _teuserName,
              ),
              SizedBox(height: 10.h),
              TextfieldGray(
                textEditingController: _tepassword,
                hintText: 'Password',
              ),
              SizedBox(height: 10.h),
              MainButtonYellow(
                  title: 'Update Password',
                  onPressed: () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    if (_teuserName.text.isNotEmpty) {
                      sharedPreferences.setString('userName', _teuserName.text);
                      Navigator.of(context).pop();
                    }

                    if (_tepassword.text.isNotEmpty) {
                      sharedPreferences.setString('password', _tepassword.text);
                      Navigator.of(context).pop();
                    }
                  }),
              SizedBox(height: 40.h),
              TextfieldGray(
                hintText: 'Passcode',
                textInputType: TextInputType.number,
                textEditingController: _tepasscode,
              ),
              SizedBox(height: 10.h),
              MainButtonYellow(
                onPressed: () {
                  if (_tepasscode.text.isNotEmpty) {
                    Navigator.of(context).pop();
                  }
                },
                title: 'Update Passcode',
              )
            ],
          ),
        ),
      ),
    );
  }
}
