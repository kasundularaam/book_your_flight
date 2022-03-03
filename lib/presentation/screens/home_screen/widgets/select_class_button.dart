import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';

class SelectClassButton extends StatelessWidget {
  final bool isSelected;
  final String text;
  final IconData icon;
  final Function onSelected;
  const SelectClassButton({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.icon,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 1.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(
              width: 0.3.w,
              color: isSelected ? AppColors.primaryColor : AppColors.darkElv1),
          color: isSelected ? AppColors.primaryColor : AppColors.lightColor,
          borderRadius: BorderRadius.circular(
            4.h,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.lightColor : AppColors.primaryColor,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              text,
              style: TextStyle(
                color:
                    isSelected ? AppColors.lightColor : AppColors.primaryColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
