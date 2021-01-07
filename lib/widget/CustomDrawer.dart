import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kassim/settings.dart';
import '../utils/constant.dart';
import '../splash.dart';

class CustomDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  CustomDrawer({this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.w), bottomRight: Radius.circular(20.w)),
      child: Drawer(
        child: Container(
          color: Color(0xff201D2E),
          child: Padding(
            padding: EdgeInsets.only(top: 120.h, bottom: 30.h),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                          backgroundColor: Color(0x20C7C7C7),
                          radius: 38.w,
                          backgroundImage: AssetImage('images/kassim.jpg')),
                      Spacer(),
                      Text(
                        'Kassim Ahmed',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'cairo'),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Spacer(flex: 2),
                DrawerItem(
                  icon: Icons.account_circle,
                  itemText: 'Account',
                  press: () {},
                ),
                Spacer(flex: 1),
                DrawerItem(
                  icon: Icons.format_list_bulleted,
                  itemText: 'Grades',
                  press: () {},
                ),
                Spacer(flex: 1),
                DrawerItem(
                  icon: EvaIcons.barChart,
                  itemText: 'Statistics',
                  press: () {},
                ),
                Spacer(flex: 1),
                DrawerItem(
                  icon: EvaIcons.settings2Outline,
                  itemText: 'Settings',
                  press: () => Navigator.popAndPushNamed(context, Settings.id),
                ),
                Spacer(flex: 4),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.remove('userName');
                      sharedPreferences.remove('password');
                      Navigator.popAndPushNamed(context, SplashScreen.id);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 35.w, right: 40.w),
                      child: Row(
                        children: <Widget>[
                          Spacer(
                            flex: 1,
                          ),
                          Icon(
                            EvaIcons.logIn,
                            color: kMainColorTheam,
                            size: 30.sp,
                          ),
                          Text(
                            '   Log out',
                            style: TextStyle(
                                color: kMainColorTheam,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'cairo'),
                          ),
                          Spacer(
                            flex: 2,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  DrawerItem(
      {this.itemText = 'Account',
      this.icon = Icons.account_circle,
      this.press});

  final String itemText;
  final IconData icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: press,
        child: Padding(
          padding: EdgeInsets.only(left: 50.w, right: 30.w),
          child: Row(
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              Icon(
                icon,
                color: kMainColorTheam,
                size: 30.sp,
              ),
              Text(
                '   ' + itemText,
                style: TextStyle(
                    color: Color(0xffE5E5E5),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'cairo'),
              ),
              Spacer(
                flex: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
