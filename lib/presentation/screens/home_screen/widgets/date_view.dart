import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';

class DateView extends StatefulWidget {
  final Function(DateTime) datePicked;
  const DateView({
    Key? key,
    required this.datePicked,
  }) : super(key: key);

  @override
  State<DateView> createState() => _DateViewState();
}

class _DateViewState extends State<DateView> {
  DateTime pickedDate = DateTime.now();
  pickDate() async {
    DateTime newDate = (await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2024),
    ))!;
    setState(() {
      pickedDate = newDate;
      widget.datePicked(newDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pickDate(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_today_rounded,
                color: AppColors.primaryColor,
                size: 20.sp,
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 0.1.h,
            color: AppColors.darkElv1,
          ),
        ],
      ),
    );
  }
}
