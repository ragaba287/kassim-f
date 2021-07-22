import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/textFieldGrey.dart';
import '../../widgets/mainYellowBtn.dart';
import '../home.dart';

//TODO Hero Animation
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

  @override
  void initState() {
    super.initState();
    checkIfFirstTime();
  }

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
        // physics: ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(95.w, 40.h, 95.w, 0.h),
          child: Column(
            children: <Widget>[
              //Logo for the app
              Image.asset(
                'images/logo.png',
                width: 230.w,
              ),

              SizedBox(height: 10.h),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Log in',
                  style: TextStyle(
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.w700,
                      fontSize: 100.sp),
                ),
              ),

              SizedBox(height: 10.h),

              //Text field for the Username
              TextfieldGray(
                  hintText: 'Username', textEditingController: _teuserName),

              SizedBox(height: 10.h),

              //Text field for the password
              TextfieldGray(
                hintText: 'Password',
                isobscure: true,
                letterSpacing: 5,
                textEditingController: _tepassword,
                // fontWeight: FontWeight.bold,
              ),

              SizedBox(height: 10.h),

              //Yellow butto to login
              MainButtonYellow(
                title: 'Login',
                onPressed: () async {
                  //TODO Fix SharedPreferences
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
              SizedBox(height: 3.h),

              //The forget button  // TODO Forget Password Screen
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
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
