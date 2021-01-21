import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/databaseHelper.dart';
import './gradeList.dart';
import './addStudent.dart';
import '../widget/GradeContainer.dart';
import '../utils/constant.dart';
import '../widget/CustomDrawer.dart';
import '../widget/CustomAppBar.dart';

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
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          leadingIconData: 'images/icons/menu.png',
          leadingOnTap: () => _scaffoldKey.currentState.openDrawer(),

          //TODO Enable Search Icon
          actionIconData: 'images/icons/search.png',
        ),

        //TODO Make Drawer More Customizable
        drawer: CustomDrawer(
          scaffoldKey: _scaffoldKey,
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x87F9B70A),
                    offset: Offset(0, 0),
                    blurRadius: 10)
              ]),
          width: 65.w,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AddStudent(gradeNumber: 1)));
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
            padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 40.h),
            //Column With The Grades
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                4,
                (index) => GradeContainer(
                  gradeNum: (index + 1) == 4 ? 'P' : (index + 1).toString(),
                  gradePrice: 6140,
                  gradeCount: 32,
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => GradeList(
                                gradeNumber: index + 1,
                              ))),
                  gradeColor: (index + 1) == 4 ? Colors.red : kMainColorTheam,
                ),
              ),
            ),
          ),
        ));
  }
}
