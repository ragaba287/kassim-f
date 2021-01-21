import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthButton extends StatefulWidget {
  const MonthButton({
    @required this.listCheck,
    @required this.index,
    this.isNote = false,
  });

  final int index;
  final List listCheck;
  final bool isNote;

  @override
  _MonthButtonState createState() => _MonthButtonState();
}

class _MonthButtonState extends State<MonthButton> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 817), allowFontScaling: true);
    return InkWell(
      onTap: () {
        setState(() {
          widget.listCheck[widget.index] == 1
              ? widget.listCheck[widget.index] = 0
              : widget.listCheck[widget.index] = 1;
        });
      },
      child: Container(
        width: widget.isNote ? 150.w : 50.w,
        height: 50.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xff201D2E).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
          color: widget.listCheck[widget.index] == 1
              ? Color(0xff201D2E)
              : Colors.white,
          border: Border.all(
            color: Color(0xff201D2E),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          widget.index > 9
              ? 'Note ${widget.index - 9}'
              : (widget.index + 1).toString(),
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: widget.listCheck[widget.index] == 1
                  ? Colors.white
                  : Colors.black),
        )),
      ),
    );
  }
}
