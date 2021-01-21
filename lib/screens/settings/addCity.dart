import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/textFieldGrey.dart';
import '../../models/city.dart';
import '../../data/databaseHelper.dart';
import '../../widget/mainYellowBtn.dart';

class AddCity extends StatefulWidget {
  static const String id = 'addCity_screen';

  @override
  _AddCityState createState() => _AddCityState();
  AddCity({this.city});
  final City city;
}

class _AddCityState extends State<AddCity> {
  TextEditingController teCity = TextEditingController();
  String _appBarTitle = 'Add New City';
  DbHelper helper;

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
    if (widget.city != null) {
      teCity.text = widget.city.city;
      _appBarTitle = 'Edit City';
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);

    return Padding(
      padding: EdgeInsets.fromLTRB(
          30.w, 0.h, 30.w, MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 300.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Text(
                    _appBarTitle,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Spacer(),
                IconButton(
                    icon: Icon(Icons.close, color: Colors.black, size: 27.nsp),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    }),
              ],
            ),
            TextfieldGray(
              textEditingController: teCity,
              hintText: 'City Name',
              isAutoFocus: true,
            ),
            MainButtonYellow(
                onPressed: () async {
                  if (teCity.text.isNotEmpty) {
                    if (widget.city == null) {
                      City city = City({
                        'City': teCity.text,
                      });
                      await helper.newCity(city);
                    } else {
                      City updatedCity = City({
                        'id': widget.city.id,
                        'City': teCity.text,
                      });
                      await helper.updateCity(updatedCity);
                    }
                    Navigator.of(context).pop();
                  }
                },
                title: ('Save')),
          ],
        ),
      ),
    );
  }
}
