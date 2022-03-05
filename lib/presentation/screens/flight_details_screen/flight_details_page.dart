import 'package:book_your_flight/core/constants/app_colors.dart';
import 'package:book_your_flight/presentation/screens/flight_details_screen/widgets/checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class FlightDetailsPage extends StatefulWidget {
  const FlightDetailsPage({Key? key}) : super(key: key);

  @override
  State<FlightDetailsPage> createState() => _FlightDetailsPageState();
}

class _FlightDetailsPageState extends State<FlightDetailsPage> {
  List<Map<String, String>> dataList = [
    {"key": "From", "value": "Sydney (SYD)"},
    {"key": "To", "value": "London (LCY)"},
    {"key": "Depart", "value": "09:45 PM"},
    {"key": "Date", "value": "7/06/22"},
    {"key": "Flight No", "value": "EB345"},
    {"key": "Travellers", "value": "4"},
    {"key": "Stops", "value": "1"}
  ];
  TextStyle keyStyle = TextStyle(
    color: AppColors.darkElv1,
    fontSize: 14.sp,
  );
  TextStyle valueStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: AppColors.lightColor,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Flight Details",
                    style: TextStyle(
                        color: AppColors.lightColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Expanded(
                child: Container(
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: AppColors.lightColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(5.w)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.darkElv0.withOpacity(
                          0.2,
                        ),
                        offset: Offset(
                          0,
                          -1.h,
                        ),
                        blurRadius: 1.h,
                      ),
                    ],
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Image.asset(
                        "assets/airline.png",
                        height: 7.h,
                        fit: BoxFit.fitHeight,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Table(
                        defaultColumnWidth: const IntrinsicColumnWidth(),
                        children: dataList
                            .map(
                              (data) => TableRow(children: [
                                Text(
                                  data["key"]!,
                                  style: keyStyle,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(":"),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                                Text(
                                  data["value"]!,
                                  style: valueStyle,
                                ),
                              ]),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        color: AppColors.primaryColor,
                        height: 0.2.h,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ticket Price",
                            style: TextStyle(
                              color: AppColors.darkElv1,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            "\$780",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Fare Tax",
                            style: TextStyle(
                              color: AppColors.darkElv1,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            "\$130",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        color: AppColors.darkElv1,
                        height: 0.2.h,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$910",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Center(child: CheckoutButton(onPressed: () {})),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
