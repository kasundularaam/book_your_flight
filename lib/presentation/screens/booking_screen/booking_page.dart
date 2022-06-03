import 'package:book_your_flight/presentation/router/app_router.dart';
import 'package:book_your_flight/presentation/screens/auth/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:book_your_flight/data/models/flight.dart';
import 'package:book_your_flight/data/models/passenger.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/booking.dart';
import '../../../logic/cubit/get_place_cubit/get_place_cubit.dart';
import '../bookings_screen/widgets/city_view.dart';

class BookingPage extends StatefulWidget {
  final Flight flight;
  final Booking booking;
  final List<Passenger> passengers;
  const BookingPage({
    Key? key,
    required this.flight,
    required this.booking,
    required this.passengers,
  }) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  Flight get flight => widget.flight;
  Booking get booking => widget.booking;
  List<Passenger> get passengers => widget.passengers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Booking",
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
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5.w)),
                child: Container(
                  color: AppColors.lightColor,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocProvider(
                            create: (context) => GetPlaceCubit(),
                            child: CityView(id: flight.origin),
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
                                flight.depart_time,
                                style: TextStyle(
                                  color: AppColors.darkElv0,
                                  fontSize: 16.sp,
                                ),
                              ),
                              Text(
                                booking.flight_ddate,
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
                                  flight.duration,
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
                                flight.depart_time,
                                style: TextStyle(
                                  color: AppColors.darkElv0,
                                  fontSize: 16.sp,
                                ),
                              ),
                              Text(
                                booking.flight_ddate,
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
                        height: 5.h,
                      ),
                      Container(
                        height: 0.1.h,
                        color: AppColors.darkElv0,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Passengers",
                        style: TextStyle(
                            color: AppColors.darkElv0,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      ListView.builder(
                          itemCount: passengers.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Passenger passenger = passengers[index];
                            return Column(
                              children: [
                                Container(
                                  width: 100.w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                      color: AppColors.lightColor,
                                      border: Border.all(
                                          color: AppColors.darkElv1,
                                          width: 0.3.w),
                                      borderRadius: BorderRadius.circular(2.w)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name: ${passenger.first_name} ${passenger.last_name}",
                                              style: TextStyle(
                                                color: AppColors.darkElv0,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              "Gender: ${passenger.gender}",
                                              style: TextStyle(
                                                color: AppColors.darkElv0,
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                              ],
                            );
                          }),
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                        child: AuthButton(
                          text: "Show Flight",
                          onPress: () => Navigator.pushNamed(
                            context,
                            AppRouter.mapPage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
