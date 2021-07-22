import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kassim/screens/settings/password.dart';
import 'package:kassim/screens/settings/prices.dart';
import 'cities.dart';
import '../../widgets/CustomAppBar.dart';

class Settings extends StatelessWidget {
  static const String id = 'settings_screen';
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leadingIconData: 'images/icons/back_ios.png',
        leadingOnTap: () => Navigator.pop(context),
        title: 'Settings',
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50.w, 80.h, 50.w, 0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: ListTile(
                leading: Padding(
                    padding: EdgeInsets.only(right: 50.w),
                    child: Container(
                        height: 40.w,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Color(0xff201D2E),
                            borderRadius: BorderRadius.circular(10.w)),
                        child: Icon(
                          Icons.attach_money,
                          color: Colors.white,
                        ))),
                title: Text('Set Prices',
                    style: TextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.w600)),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.pushNamed(context, PricesScreen.id),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: ListTile(
                leading: Padding(
                    padding: EdgeInsets.only(right: 50.w),
                    child: Container(
                        height: 40.w,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Color(0xff201D2E),
                            borderRadius: BorderRadius.circular(10.w)),
                        child: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ))),
                title: Text('Password',
                    style: TextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.w600)),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.pushNamed(context, PasswordScreen.id),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: ListTile(
                leading: Padding(
                    padding: EdgeInsets.only(right: 50.w),
                    child: Container(
                        height: 40.w,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Color(0xff201D2E),
                            borderRadius: BorderRadius.circular(10.w)),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ))),
                title: Text('Cities',
                    style: TextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.w600)),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.pushNamed(context, Cities.id),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: ListTile(
                leading: Padding(
                    padding: EdgeInsets.only(right: 50.w),
                    child: Container(
                        height: 40.w,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Color(0xff201D2E),
                            borderRadius: BorderRadius.circular(10.w)),
                        child: Transform.rotate(
                          angle: -60,
                          child: Icon(
                            Icons.brightness_2,
                            color: Colors.white,
                          ),
                        ))),
                title: Text('Dark Mode',
                    style: TextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.w600)),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.pushNamed(context, Cities.id),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
