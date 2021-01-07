import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './addCity.dart';
import './utils/constant.dart';
import './widget/CustomAppBar.dart';
import './models/city.dart';
import './data/databaseHelper.dart';

class Cities extends StatefulWidget {
  static const String id = 'cities_Screen';

  @override
  CitiesState createState() => CitiesState();
}

class CitiesState extends State<Cities> {
  DbHelper helper;
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: false);

    void addNewCityBottomSheet({@required BuildContext context, City city}) {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          context: context,
          isScrollControlled: true,
          builder: (_) => SingleChildScrollView(child: AddCity(city: city)));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          title: 'Cities',
          leadingicon: Icons.arrow_back_ios,
          leadingOnTap: () => Navigator.of(context).pop()),
      body: FutureBuilder(
        future: helper.allCities(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0x80FDDB3A)),
                backgroundColor: Colors.white,
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  City city = City.fromMap(snapshot.data[index]);
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: ListTile(
                        title: Text(/*${city.id}*/ ' ${city.city}',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w400)),
                        trailing: IconButton(
                            icon: Icon(EvaIcons.close,
                                size: 25.w, color: Colors.black),
                            onPressed: () {
                              setState(() {
                                helper.deleteCity(city.id);
                              });
                            }),
                        onTap: () => addNewCityBottomSheet(
                            context: context, city: city)),
                  );
                },
                separatorBuilder: (ctx, intd) {
                  return Divider(
                    indent: 80.w,
                    endIndent: 80.w,
                    height: 12.h,
                    thickness: 1,
                    color: kMainColorTheam.withAlpha(50),
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          addNewCityBottomSheet(context: context);
        },
        child: Image.asset('images/icons/plus_small.png'),
        backgroundColor: kMainColorTheam,
      ),
    );
  }
}
