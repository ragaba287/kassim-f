import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './data/databaseHelper.dart';
import './utils/constant.dart';
import './widget/CustomAppBar.dart';
import './models/prices.dart';

DbHelper helper;

class PricesScreen extends StatefulWidget {
  static const String id = 'prices_screen';
  @override
  PricesState createState() => PricesState();
}

class PricesState extends State<PricesScreen> {
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: false);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Prices',
          leadingicon: Icons.arrow_back_ios,
          leadingOnTap: () => Navigator.pop(context),
        ),
        body: FutureBuilder(
          future: helper.allPrices(),
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
                padding: EdgeInsets.fromLTRB(40.w, 40.h, 40.w, 0),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Prices prices = Prices.fromMap(snapshot.data[index]);
                    return Card(
                      elevation: 2,
                      margin: EdgeInsets.only(bottom: 30.h),
                      // color: Color(0xffF4F5F7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.w),
                          side: BorderSide(
                            color: kMainColorTheam,
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Grade ${prices.gradeId}',
                              style: TextStyle(
                                color: kMainColorTheam,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 25.h, bottom: 25.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Month',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        Prices updatedPrices = Prices({
                                          'gradeId': index + 1,
                                          'monthPrice': prices.monthPrice - 5,
                                          'note1Price': prices.note1Price,
                                          'note2Price': prices.note2Price,
                                        });
                                        helper.updatePrice(updatedPrices);
                                      });
                                    },
                                    child: Text('-',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w800)),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(prices.monthPrice.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w800,
                                        )),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        Prices updatedPrices = Prices({
                                          'gradeId': index + 1,
                                          'monthPrice': prices.monthPrice + 5,
                                          'note1Price': prices.note1Price,
                                          'note2Price': prices.note2Price,
                                        });
                                        helper.updatePrice(updatedPrices);
                                      });
                                    },
                                    child: Text('+',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w800)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 25.h, bottom: 25.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Note 1',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        Prices updatedPrices = Prices({
                                          'gradeId': index + 1,
                                          'monthPrice': prices.monthPrice,
                                          'note1Price': prices.note1Price - 1,
                                          'note2Price': prices.note2Price,
                                        });
                                        helper.updatePrice(updatedPrices);
                                      });
                                    },
                                    child: Text('-',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w800)),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(prices.note1Price.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w800,
                                        )),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        Prices updatedPrices = Prices({
                                          'gradeId': index + 1,
                                          'monthPrice': prices.monthPrice,
                                          'note1Price': prices.note1Price + 1,
                                          'note2Price': prices.note2Price,
                                        });
                                        helper.updatePrice(updatedPrices);
                                      });
                                    },
                                    child: Text('+',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w800)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 25.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Note 2',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        Prices updatedPrices = Prices({
                                          'gradeId': index + 1,
                                          'monthPrice': prices.monthPrice,
                                          'note1Price': prices.note1Price,
                                          'note2Price': prices.note2Price - 1,
                                        });
                                        helper.updatePrice(updatedPrices);
                                      });
                                    },
                                    child: Text('-',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w800)),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(prices.note2Price.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w800,
                                        )),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        Prices updatedPrices = Prices({
                                          'gradeId': index + 1,
                                          'monthPrice': prices.monthPrice,
                                          'note1Price': prices.note1Price,
                                          'note2Price': prices.note2Price + 1,
                                        });
                                        helper.updatePrice(updatedPrices);
                                      });
                                    },
                                    child: Text('+',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w800)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ));
  }
}

class _GradeRow extends StatefulWidget {
  _GradeRow({
    @required this.index,
    @required this.title,
    this.monthPrice = 0,
    this.note1Price = 0,
    this.note2Price = 0,
  });

  final int index;
  final String title;
  final int monthPrice;
  final int note1Price;
  final int note2Price;

  @override
  _GradeRowState createState() => _GradeRowState();
}

class _GradeRowState extends State<_GradeRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w100),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              switch (widget.title) {
                case "Month":
                  {
                    if (widget.monthPrice > 20) {
                      setState(() {
                        Prices updatedPrices = Prices({
                          'gradeId': 1,
                          'monthPrice': 90,
                          'note1Price': 91,
                          'note2Price': 92,
                        });
                        helper.updatePrice(updatedPrices);
                      });
                    }
                  }
                  break;
                case "Note 1":
                  {
                    if (widget.monthPrice > 0) {
                      setState(() {
                        // gradePrice[widget.index].note1Price -= 1;
                      });
                    }
                  }
                  break;
                case "Note 2":
                  {
                    if (widget.monthPrice > 0) {
                      setState(() {
                        // gradePrice[widget.index].note2Price -= 1;
                      });
                    }
                  }
              }
            },
            child: Text('-',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
                (() {
                  switch (widget.title) {
                    case "Month":
                      {
                        return widget.monthPrice.toString();
                      }
                      break;
                    case "Note 1":
                      {
                        return widget.note1Price.toString();
                      }
                      break;
                    case "Note 2":
                      {
                        return widget.note2Price.toString();
                      }
                  }
                }()),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                )),
          ),
          // InkWell(
          //   onTap: () {
          //     switch (widget.title) {
          //       case "Month":
          //         {
          //           if (gradePrice[widget.index].monthPrice > 20) {
          //             setState(() {
          //               gradePrice[widget.index].monthPrice += 5;
          //             });
          //           }
          //         }
          //         break;
          //       case "Note 1":
          //         {
          //           if (gradePrice[widget.index].note1Price > 0) {
          //             setState(() {
          //               gradePrice[widget.index].note1Price += 1;
          //             });
          //           }
          //         }
          //         break;
          //       case "Note 2":
          //         {
          //           if (gradePrice[widget.index].note2Price > 0) {
          //             setState(() {
          //               gradePrice[widget.index].note2Price += 1;
          //             });
          //           }
          //         }
          //     }
          //   },
          //   child: Text('+',
          //       style: TextStyle(
          //           color: kMainColorTheam,
          //           fontSize: 20.sp,
          //           fontWeight: FontWeight.w800)),
          // ),
        ],
      ),
    );
  }
}
