import 'package:flutter/material.dart';
import 'package:tasky/core/components/task_states_enum.dart';
import 'package:tasky/core/helpers/color_helper.dart';

class StateContainer extends StatelessWidget {
  const StateContainer({super.key, required this.taskState});

  final TaskStatesEnum taskState;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: addBackground(),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        taskStatesValues[taskState]!,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: addColor(),
        ),
      ),
    );
  }
  addColor(){
    switch(taskState){
      case TaskStatesEnum.all:
        return AppColorHelper.purpleColor;
      case TaskStatesEnum.inProgress:
        return AppColorHelper.purpleColor;
      case TaskStatesEnum.waiting:
        return AppColorHelper.orangeColor;
      case TaskStatesEnum.finished:
        return AppColorHelper.blueColor;
    }
  }
  addBackground(){
    switch(taskState){
      case TaskStatesEnum.all:
        return AppColorHelper.lightPurpleColor;
      case TaskStatesEnum.inProgress:
        return AppColorHelper.lightPurpleColor;
      case TaskStatesEnum.waiting:
        return AppColorHelper.lightOrangeColor;
      case TaskStatesEnum.finished:
        return AppColorHelper.lightBlueColor;
    }
  }
}
