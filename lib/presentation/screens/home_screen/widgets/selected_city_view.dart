import 'package:book_your_flight/core/constants/app_colors.dart';
import 'package:book_your_flight/presentation/screens/home_screen/widgets/select_city_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SelectedCityView extends StatefulWidget {
  const SelectedCityView({Key? key}) : super(key: key);

  @override
  State<SelectedCityView> createState() => _SelectedCityViewState();
}

class _SelectedCityViewState extends State<SelectedCityView> {
  CityWithCode cityWithCode = CityWithCode(city: "Sydney", code: "SYD");
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSearch(
        context: context,
        delegate: SelectCityField(onSelected: (cwc) {
          setState(() {
            cityWithCode = cwc;
          });
        }),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cityWithCode.city,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            cityWithCode.code,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 0.1.h,
            color: AppColors.darkElv0,
          ),
        ],
      ),
    );
  }
}
