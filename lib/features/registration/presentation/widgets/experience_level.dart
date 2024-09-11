import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/color_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';


class ExperienceLevel extends StatefulWidget {
  const ExperienceLevel({super.key, required this.label, this.width, required this.hintText, this.controller, this.haveValue, required this.menuItems, this.onSelected});

  final String label;
  final double? width;
  final String hintText;
  final TextEditingController? controller;
  final bool? haveValue;
  final List menuItems;
  final void Function(int?)? onSelected;

  @override
  State<ExperienceLevel> createState() => _ExperienceLevelState();
}

class _ExperienceLevelState extends State<ExperienceLevel> {
  int selectedValue = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownMenu(
        menuHeight: 250,
        controller: widget.controller,
        onSelected: widget.onSelected,
        hintText: widget.hintText,
        textStyle: AppTextStyleHelper.font14MediumBlack,
        width: MediaQuery.of(context).size.width > 400 ? 352 : MediaQuery.of(context).size.width - 48,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: AppTextStyleHelper.font14MediumBlack,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 11,
          ),
          border: getInputBorder(),
          errorBorder:  getInputBorder(),
          enabledBorder: getInputBorder(),
          focusedBorder: getInputBorder(),
        ),
        dropdownMenuEntries: dropDownItemMaker(items: widget.menuItems),

      ),
    );
  }

  List<DropdownMenuEntry<int>> dropDownItemMaker({required List items}){
    List<DropdownMenuEntry<int>> dropDownItems = [];

    for(int i = 0 ; i < items.length ; i++){
      dropDownItems.add(DropdownMenuEntry(
        value: i,
        label: items[i],
        labelWidget: Text(
          items[i].toString(),
          style: AppTextStyleHelper.font14MediumBlack,
        ),
      ),);
    }

    return dropDownItems;
  }

  OutlineInputBorder getInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: AppColorHelper.greyColor,
        width: 2,
      ),
    );
  }

}
