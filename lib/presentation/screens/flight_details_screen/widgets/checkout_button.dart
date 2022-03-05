import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class CheckoutButton extends StatelessWidget {
  final Function onPressed;
  const CheckoutButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 2.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(
            5.h,
          ),
        ),
        child: Text(
          "Checkout",
          style: TextStyle(
            color: AppColors.lightColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
