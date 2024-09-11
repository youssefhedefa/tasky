import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/helpers/color_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';

class CustomPriorityContainer extends StatefulWidget {
  const CustomPriorityContainer(
      {super.key,
      required this.callback,
      required this.options,
      required this.label,
      required this.hasFlagIcon});

  final Function callback;
  final List<String> options;
  final String label;
  final bool hasFlagIcon;

  @override
  State<CustomPriorityContainer> createState() =>
      _CustomPriorityContainerState();
}

class _CustomPriorityContainerState extends State<CustomPriorityContainer> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.options[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColorHelper.lightPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        items: getDropdownItems(),
        onChanged: (value) {
          setState(() {
            dropdownValue = value!;
          });
          widget.callback(value);
        },
        hint: Row(
          children: [
            widget.hasFlagIcon
                ? const Icon(
                    Icons.flag_outlined,
                    size: 20,
                    color: AppColorHelper.primaryColor,
                  )
                : const SizedBox(width: 0),
            const SizedBox(width: 8),
            Text(buildText(dropdownValue),
                style: AppTextStyleHelper.font16BoldPrimary),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
        underline: const SizedBox(),
        isExpanded: true,
        iconSize: 40,
        iconEnabledColor: AppColorHelper.primaryColor,
        iconDisabledColor: AppColorHelper.primaryColor,
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    return widget.options.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
        ),
      );
    }).toList();
  }

  buildText(String text) {
    if (widget.hasFlagIcon) {
      return '$text Priority';
    }
    return text;
  }
}
