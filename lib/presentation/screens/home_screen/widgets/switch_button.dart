import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';

class SwitchButton extends StatelessWidget {
  final bool selected;
  final String text;
  final Function onTap;
  const SwitchButton({
    Key? key,
    required this.selected,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 1.h,
        ),
        decoration: BoxDecoration(
          color: selected ? AppColors.lightColor : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(
            3.h,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? AppColors.primaryColor : AppColors.lightColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
