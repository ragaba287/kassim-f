import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import './sgin/signin.dart';
import '../utils/constant.dart';

//TODO Hero Animation
class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return Scaffold(
      backgroundColor: Color(0xff201D2E),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 70.h, left: 45.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Hello Text
                Text(
                  'Hello,',
                  style: TextStyle(
                      fontSize: 40.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                      height: 1,
                      fontFamily: 'cairo'),
                ),

                //App Owner Name
                Text(
                  'Dr.Kassim!',
                  style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                      height: 1,
                      fontFamily: 'cairo',
                      color: kMainColorTheam),
                ),

                //A welcome text to the owner
                Text(
                  'Welcome back Dr.Kassim',
                  style: TextStyle(
                      fontSize: 12.sp,
                      height: 2,
                      letterSpacing: 2,
                      color: Color(0xff87858E),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'cairo'),
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              //Yellow Gradiend path
              Align(
                alignment: Alignment.bottomRight,
                child: ClipPath(
                  clipper: _MyClipper(),
                  child: Container(
                    height: 520.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        kMainColorTheam,
                        kMainColorTheam.withOpacity(.35)
                      ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                    ),
                  ),
                ),
              ),

              //space man image
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  // width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .65,
                  margin: EdgeInsets.only(bottom: 25.h),
                  child: Image(image: AssetImage('images/spaceMan.png')),
                ),
              ),

              //Left button navagate to sigin //TODO Transition To SginIn Screen
              Positioned(
                left: 30.w,
                bottom: 50.h,
                child: RaisedButton(
                  elevation: 10,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Signin()),
                  ),
                  shape: CircleBorder(),
                  color: Color(0x57191C27),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    child: BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 7.0, sigmaY: 9.0),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Icon(Icons.arrow_back,
                              color: Colors.white, size: 30.h),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0x40191C27),
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x57191c27),
                                  offset: Offset(0, 9),
                                  blurRadius: 20)
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//Clipper for the Gradient yellow right path
class _MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.moveTo(size.width, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(60.w, size.height);
    path.cubicTo(-40.w, 350.h, size.width - 270, 0, size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}
