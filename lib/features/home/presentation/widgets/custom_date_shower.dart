import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/helpers/color_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';

class CustomDateShower extends StatefulWidget {
  const CustomDateShower({super.key, required this.hasBackground, required this.callback, this.label, required this.clickable});

  final bool hasBackground;
  final String? label;
  final Function callback;
  final bool clickable;

  @override
  State<CustomDateShower> createState() => _CustomDateShowerState();
}

class _CustomDateShowerState extends State<CustomDateShower> {

  String date = 'choose due date...';

  @override
  void initState() {
    if(widget.label != null){
      date = widget.label!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
      decoration: widget.hasBackground ? BoxDecoration(
        color: AppColorHelper.lightPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ) : BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColorHelper.greyColor,
          width: 1.5,
        ),
      ),
      child: MaterialButton(
        onPressed: widget.clickable? () {
          showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime(2025),
            initialDate: DateTime.now(),
          ).then((value) {
            if (value != null) {
              print('object');
              setState(() {
                date = '${value.day}/${value.month}/${value.year}';
              });
               widget.callback(value);
            }
          });
        } : null,
        child: Row(
          children: [
            Text(
              date,
              style: widget.hasBackground ? AppTextStyleHelper.font14MediumBlack : AppTextStyleHelper.font14RegularGrey,
            ),
            const Spacer(),
            const Icon(
              Icons.calendar_today_outlined,
              size: 20,
              color: AppColorHelper.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
