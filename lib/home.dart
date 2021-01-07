import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kassim/data/databaseHelper.dart';
import './utils/studentData.dart';
import './utils/constant.dart';
import './gradeList.dart';
import './widget/CustomDrawer.dart';
import './widget/CustomAppBar.dart';
import './addStudent.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        drawer: CustomDrawer(
          scaffoldKey: _scaffoldKey,
        ),
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          leadingIconData: 'images/icons/menu.png',
          leadingOnTap: () => _scaffoldKey.currentState.openDrawer(),
          actionIconData: 'images/icons/search.png',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration: BoxDecoration(
              color: Color(0x40191C27),
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x87F9B70A),
                    offset: Offset(0, 3),
                    blurRadius: 10)
              ]),
          height: 75.w,
          width: 75.w,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddStudent()));
              },
              elevation: 0,
              backgroundColor: kMainColorTheam,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Image.asset('images/icons/plus.png'),
              ),
            ),
          ),
        ),
        bottomNavigationBar: FABBottomAppBar(
          color: Color(0xff201D2E),
          selectedColor: Color(0xff201D2E),
          backgroundColor: Color(0xffF4F5F7),
          // backgroundColor: Colors.red,
          notchedShape: CircularNotchedRectangle(),
          items: [
            FABBottomAppBarItem(
                text: 'images/icons/home.png', iconData: EvaIcons.home),
            FABBottomAppBarItem(
              text: 'images/icons/settoings.png',
              iconData: EvaIcons.settings2,
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _GradeContainer(
                    gradeNum: '1',
                    gradePrice: 4560,
                    gradeCount: studentNames.length,
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => GradeList())),
                    gradeColor: kMainColorTheam),
                _GradeContainer(
                    gradeNum: '2',
                    gradePrice: 6140,
                    gradeCount: 32,
                    press: () {},
                    gradeColor: kMainColorTheam),
                _GradeContainer(
                    gradeNum: '3',
                    gradePrice: 1200,
                    gradeCount: 24,
                    press: () {},
                    gradeColor: kMainColorTheam),
                _GradeContainer(
                    gradeNum: 'p',
                    gradePrice: 3900,
                    gradeCount: 13,
                    press: () {},
                    gradeColor: Color(0xffE10000)),
              ],
            ),
          ),
        ));
  }
}

class _GradeContainer extends StatelessWidget {
  _GradeContainer(
      {this.gradeNum = '1',
      this.gradePrice = 0,
      this.gradeCount = 0,
      this.press,
      this.gradeColor = Colors.amber});

  final String gradeNum;
  final int gradePrice;
  final int gradeCount;
  final Function press;
  final Color gradeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.w),
        child: Container(
          width: double.infinity,
          height: 130.h,
          decoration: BoxDecoration(
            color: Color(0xff201D2E),
            // borderRadius: BorderRadius.circular(30),
            // boxShadow: [
            //   BoxShadow(
            //       color: const Color(0x57191c27),
            //       offset: Offset(0, 5),
            //       blurRadius: 20)
            // ]
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    gradeNum,
                    style: TextStyle(
                        color: gradeColor,
                        fontSize: 60.sp,
                        fontFamily: 'hpSimplified',
                        fontWeight: FontWeight.w900),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            gradePrice.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'hpSimplified'),
                          ),
                          Text(
                            ' E£            ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'hpSimplified'),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            gradeCount.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'hpSimplified'),
                          ),
                          Text(
                            '  Student',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'hpSimplified'),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
