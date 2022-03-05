import 'package:book_your_flight/core/constants/app_colors.dart';
import 'package:book_your_flight/presentation/screens/flight_list_screen.dart/widgets/details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class FlightListPage extends StatefulWidget {
  const FlightListPage({Key? key}) : super(key: key);

  @override
  State<FlightListPage> createState() => _FlightListPageState();
}

class _FlightListPageState extends State<FlightListPage> {
  String dropdownValue = 'Price';

  // List of items in our dropdown menu
  var items = [
    'Price',
    'Size',
    'Seats',
    'Speed',
  ];
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color: AppColors.lightColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(5.w),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkElv0.withOpacity(
                        0.2,
                      ),
                      offset: Offset(
                        0,
                        1.h,
                      ),
                      blurRadius: 1.h,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: AppColors.primaryColor,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Flights List",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: AppColors.primaryColor.withOpacity(0.5),
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "Sydney- London",
                          style: TextStyle(
                            color: AppColors.darkElv1,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_upward_rounded,
                          color: AppColors.primaryColor.withOpacity(0.5),
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "7/06/22",
                          style: TextStyle(
                            color: AppColors.darkElv1,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.arrow_downward_rounded,
                          color: AppColors.primaryColor.withOpacity(0.5),
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "20/06/22",
                          style: TextStyle(
                            color: AppColors.darkElv1,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person_rounded,
                          color: AppColors.primaryColor.withOpacity(0.5),
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "2",
                          style: TextStyle(
                            color: AppColors.darkElv1,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.child_care_rounded,
                          color: AppColors.primaryColor.withOpacity(0.5),
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "3",
                          style: TextStyle(
                            color: AppColors.darkElv1,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.shopping_bag_rounded,
                          color: AppColors.primaryColor.withOpacity(0.5),
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "5kg",
                          style: TextStyle(
                            color: AppColors.darkElv1,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.airline_seat_recline_normal_rounded,
                          color: AppColors.primaryColor.withOpacity(0.5),
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "Economy",
                          style: TextStyle(
                            color: AppColors.darkElv1,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Sort by:",
                          style: TextStyle(
                            color: AppColors.lightColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 0.5.h),
                          decoration: BoxDecoration(
                              color: AppColors.lightColor.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(2.h)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isDense: true,
                              dropdownColor: AppColors.lightColor,
                              focusColor: AppColors.lightColor,
                              value: dropdownValue,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.primaryColor,
                              ),
                              items: items.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "15 Flights are available Sydney to London",
                      style: TextStyle(
                        color: AppColors.lightColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) => const DetailsCard()))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
