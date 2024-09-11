import 'package:flutter/material.dart';
import 'package:tasky/core/components/priority_enum.dart';
import 'package:tasky/core/helpers/color_helper.dart';

class PriorityFlag extends StatelessWidget {
  const PriorityFlag({super.key, required this.priority,});

  final PriorityEnum priority;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.flag,
          color: addColor(),
        ),
        const SizedBox(width: 4),
        Text(
          addText(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: addColor(),
          ),
        ),
      ],
    );
  }

  addText(){
    switch(priority){
      case PriorityEnum.low:
        return 'Low';
      case PriorityEnum.medium:
        return 'Medium';
      case PriorityEnum.high:
        return 'High';
    }
  }

  addColor(){
    switch(priority){
      case PriorityEnum.low:
        return AppColorHelper.blueColor;
      case PriorityEnum.medium:
        return AppColorHelper.purpleColor;
      case PriorityEnum.high:
        return AppColorHelper.orangeColor;
    }
  }

}
