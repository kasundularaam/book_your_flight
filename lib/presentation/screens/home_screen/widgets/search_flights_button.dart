import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';

class SearchFlightsButton extends StatelessWidget {
  final Function onPressed;
  const SearchFlightsButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 1.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(
            4.h,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Search Flights",
              style: TextStyle(
                color: AppColors.lightColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Icon(
              Icons.flight_takeoff_rounded,
              color: AppColors.lightColor,
              size: 30.sp,
            ),
          ],
        ),
      ),
    );
  }
}
