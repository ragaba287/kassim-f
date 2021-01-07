import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widget/textFieldGrey.dart';
import '../../utils/constant.dart';
import '../../home.dart';

class Signin extends StatefulWidget {
  static const String id = 'signin_screen';

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _teuserName = TextEditingController();
  final _tepassword = TextEditingController();
  String _userName = '', _password = '';

  SharedPreferences sharedPreferences;

  void checkIfFirstTime() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.get('userName') == null) {
      sharedPreferences.setString('userName', '');
      sharedPreferences.setString('password', '');
    } else {
      _userName = sharedPreferences.getString('userName');
      _password = sharedPreferences.getString('password');
    }
  }

  @override
  void initState() {
    super.initState();
    checkIfFirstTime();
  }

  @override
  void dispose() {
    super.dispose();
    _teuserName.dispose();
    _tepassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(817, 375), allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(80.w, 40.h, 80.w, 0.h),
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                width: 250.w,
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Log in',
                  style: TextStyle(
                      fontFamily: 'brlns',
                      fontWeight: FontWeight.w400,
                      fontSize: 120.sp),
                ),
              ),
              SizedBox(height: 20.h),
              TextfieldGray(
                  hintText: 'Username', textEditingController: _teuserName),
              SizedBox(height: 10.h),
              TextfieldGray(
                hintText: 'Password',
                isobscure: true,
                letterSpacing: 5,
                textEditingController: _tepassword,
                // fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.h),
              MainButtonYellow(
                title: 'Login',
                onPressed: () async {
                  sharedPreferences = await SharedPreferences.getInstance();

                  if (_teuserName.text == _userName &&
                      _tepassword.text == _password) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomeScreen()));
                  } else {
                    print('Username or Password is Wrong');
                  }
                },
              ),
              SizedBox(
                height: 3.h,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Forgot the password?',
                  style: TextStyle(
                      fontSize: 35.sp,
                      letterSpacing: 1,
                      color: Color(0xffA8A8A8),
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
