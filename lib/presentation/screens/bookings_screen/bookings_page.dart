import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/booking.dart';
import '../../../logic/cubit/bookings_cubit/bookings_cubit.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({Key? key}) : super(key: key);

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BookingsCubit>(context).loadBookings();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Text(
              "Bookings",
              style: TextStyle(
                  color: AppColors.lightColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5.w)),
            child: Container(
              color: AppColors.lightColor,
              child: BlocConsumer<BookingsCubit, BookingsState>(
                listener: (context, state) {
                  if (state is BookingsFailed) {
                    SnackBar snackBar =
                        SnackBar(content: Text(state.errorMsg.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  if (state is BookingsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                  if (state is BookingsLoaded) {
                    return ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        ListView.builder(
                            itemCount: state.bookings.length,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final Booking booking = state.bookings[index];
                              return Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(3.w),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Sydney",
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "(SYD)",
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "London",
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "(LCY)",
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                        color:
                                                            AppColors.darkElv1,
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
                                                        color:
                                                            AppColors.darkElv1,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  )
                                ],
                              );
                            }),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    );
                  }
                  return const Center(child: SizedBox());
                },
              ),
            ),
          ))
        ],
      )),
    );
  }
}
