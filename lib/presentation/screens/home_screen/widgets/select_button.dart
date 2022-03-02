import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:book_your_flight/core/constants/app_colors.dart';

class SelectButton extends StatefulWidget {
  final String text;
  final bool? selected;
  final Function(bool) onTap;
  const SelectButton({
    Key? key,
    required this.text,
    this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    isSelected = widget.selected ?? false;
  }

  tapButton() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tapButton();
        widget.onTap(isSelected);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 1.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightColor : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(
            3.h,
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: isSelected ? AppColors.primaryColor : AppColors.lightColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
