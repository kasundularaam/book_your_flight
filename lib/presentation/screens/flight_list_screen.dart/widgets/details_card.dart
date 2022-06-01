import 'package:book_your_flight/logic/cubit/get_place_cubit/get_place_cubit.dart';
import 'package:book_your_flight/presentation/screens/flight_list_screen.dart/widgets/city_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/flight.dart';
import '../../../router/app_router.dart';

class DetailsCard extends StatefulWidget {
  final Flight flight;
  const DetailsCard({
    Key? key,
    required this.flight,
  }) : super(key: key);

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  Flight get flight => widget.flight;
  Widget buildDivider() {
    List<Widget> itemList = [];
    const int itemCount = 31;
    final double width = 100.w - ((5.w * 2) * 2);
    final double itemLength = width / itemCount;
    final Widget dark = Container(
      height: 0.2.h,
      width: itemLength,
      color: AppColors.darkElv1,
    );
    Widget space = SizedBox(
      width: itemLength,
    );

    for (int i = 0; i < itemCount; i++) {
      if (i % 2 == 0) {
        itemList.add(dark);
      } else {
        itemList.add(space);
      }
    }
    final Widget divider = Row(
      children: itemList,
    );
    return divider;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () =>
              Navigator.pushNamed(context, AppRouter.flightDetailsPage),
          child: Container(
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              color: AppColors.lightColor,
              borderRadius: BorderRadius.circular(5.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Departure:",
                  style: TextStyle(
                    color: AppColors.darkElv1,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocProvider(
                      create: (context) => GetPlaceCubit(),
                      child: CityView(id: flight.origin),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    BlocProvider(
                      create: (context) => GetPlaceCubit(),
                      child: CityView(id: flight.destination),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "09:45 PM",
                          style: TextStyle(
                            color: AppColors.darkElv0,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          "tue, 7 jun",
                          style: TextStyle(
                            color: AppColors.darkElv1,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "25h 15m",
                            style: TextStyle(
                              color: AppColors.darkElv1,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Container(
                            height: 0.1.h,
                            color: AppColors.darkElv0,
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            "1 Stop",
                            style: TextStyle(
                              color: AppColors.darkElv1,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "12:00 PM",
                          style: TextStyle(
                            color: AppColors.darkElv0,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          "wed, 8 jun",
                          style: TextStyle(
                            color: AppColors.darkElv1,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                buildDivider(),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Return:",
                  style: TextStyle(
                    color: AppColors.darkElv1,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "London",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "(LCY)",
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Sydney",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "(SYD)",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "08:45 PM",
                          style: TextStyle(
                            color: AppColors.darkElv0,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          "Sun, 20 jun",
                          style: TextStyle(
                            color: AppColors.darkElv1,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "25h 15m",
                            style: TextStyle(
                              color: AppColors.darkElv1,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Container(
                            height: 0.1.h,
                            color: AppColors.darkElv0,
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            "1 Stop",
                            style: TextStyle(
                              color: AppColors.darkElv1,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "11:00 PM",
                          style: TextStyle(
                            color: AppColors.darkElv0,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          "mon, 21 jun",
                          style: TextStyle(
                            color: AppColors.darkElv1,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                buildDivider(),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/airline.png",
                      height: 5.h,
                      fit: BoxFit.fitHeight,
                    ),
                    Text(
                      "\$780",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
