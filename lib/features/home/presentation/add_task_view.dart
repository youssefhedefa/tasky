import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/components/custom_button.dart';
import 'package:tasky/core/helpers/color_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/features/home/presentation/widgets/add_task_field.dart';
import 'package:tasky/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:tasky/features/home/presentation/widgets/image_selection_container.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  String dropdownValue = 'Medium';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add new task',
      ),
      body: Padding(
        padding: EdgeInsets.all(22.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ImageSelectionContainer(),
              AddTaskField(
                label: 'Title',
                controller: TextEditingController(),
                hintText: 'Enter task title',
                isMultiline: false,
              ),
              AddTaskField(
                label: 'Description',
                controller: TextEditingController(),
                hintText: 'Enter description title',
                isMultiline: true,
              ),
              AddTaskField(
                label: 'Priority',
                input: priorityWidget(),
              ),
              AddTaskField(
                label: 'Due date',
                input: dateShower(),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                child: Text(
                  'Add Task',
                  style: AppTextStyleHelper.font19BoldWhite,
                ),
                onPressed: () {
                  addTaskAction();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    return const [
      DropdownMenuItem(
        value: 'Low',
        child: Text('Low'),
      ),
      DropdownMenuItem(
        value: 'Medium',
        child: Text('Medium'),
      ),
      DropdownMenuItem(
        value: 'High',
        child: Text('High'),
      ),
    ];
  }

  priorityWidget() {
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
        },
        hint: Row(
          children: [
            const Icon(
              Icons.flag_outlined,
              size: 20,
              color: AppColorHelper.primaryColor,
            ),
            const SizedBox(width: 8),
            Text('$dropdownValue Priority',
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

  dateShower() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColorHelper.greyColor,
          width: 1.5,
        ),
      ),
      child: MaterialButton(
        onPressed: () {
          showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime(2025),
            initialDate: DateTime.now(),
          );
        },
        child: Row(
          children: [
            Text(
              'choose due date...',
              style: AppTextStyleHelper.font14RegularGrey,
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

  addTaskAction(){}

}

