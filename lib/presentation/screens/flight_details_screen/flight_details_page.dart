import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:book_your_flight/data/models/passenger.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/flight.dart';
import '../../../logic/cubit/get_place_cubit/get_place_cubit.dart';
import '../../router/app_router.dart';
import 'widgets/checkout_button.dart';
import 'widgets/city_view.dart';

class FlightDetailsPage extends StatefulWidget {
  final Flight flight;
  final String seatClass;
  final List<Passenger> passengers;
  const FlightDetailsPage({
    Key? key,
    required this.flight,
    required this.seatClass,
    required this.passengers,
  }) : super(key: key);

  @override
  State<FlightDetailsPage> createState() => _FlightDetailsPageState();
}

class _FlightDetailsPageState extends State<FlightDetailsPage> {
  Flight get flight => widget.flight;
  String get seatClass => widget.seatClass;
  List<Passenger> get passengers => widget.passengers;
  TextStyle keyStyle = TextStyle(
    color: AppColors.darkElv1,
    fontSize: 14.sp,
  );
  TextStyle valueStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  double getPrice() {
    if (seatClass == "economy") {
      return flight.economy_fare;
    }
    if (seatClass == "business") {
      return flight.business_fare;
    }
    if (seatClass == "first") {
      return flight.first_fare;
    }
    return 0.00;
  }

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
                height: 2.h,
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Table(
                            defaultColumnWidth: const IntrinsicColumnWidth(),
                            children: [
                              TableRow(children: [
                                Text(
                                  "From",
                                  style: keyStyle,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        const Text(":"),
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
                                BlocProvider(
                                  create: (context) => GetPlaceCubit(),
                                  child: CityView(id: flight.origin),
                                )
                              ]),
                              TableRow(children: [
                                Text(
                                  "To",
                                  style: keyStyle,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        const Text(":"),
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
                                BlocProvider(
                                  create: (context) => GetPlaceCubit(),
                                  child: CityView(id: flight.destination),
                                )
                              ]),
                              TableRow(children: [
                                Text(
                                  "Depart",
                                  style: keyStyle,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        const Text(":"),
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
                                  flight.depart_time,
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ]),
                              TableRow(children: [
                                Text(
                                  "Flight",
                                  style: keyStyle,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        const Text(":"),
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
                                  flight.plane,
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ]),
                              TableRow(children: [
                                Text(
                                  "Airline",
                                  style: keyStyle,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        const Text(":"),
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
                                  flight.airline,
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ]),
                              TableRow(children: [
                                Text(
                                  "Duration",
                                  style: keyStyle,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        const Text(":"),
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
                                  flight.duration,
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ]),
                            ]),
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
                            "$seatClass Fare",
                            style: TextStyle(
                              color: AppColors.darkElv1,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            "\$${getPrice()}",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14.sp,
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
                            "Passengers",
                            style: TextStyle(
                              color: AppColors.darkElv1,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            "${passengers.length}",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
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
                            "Total fare",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$${getPrice() * passengers.length}",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                        child: CheckoutButton(
                          onPressed: () => Navigator.pushNamed(
                              context, AppRouter.checkoutPage, arguments: {
                            "flight": flight,
                            "seatClass": seatClass,
                            "passengers": passengers
                          }),
                        ),
                      ),
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
