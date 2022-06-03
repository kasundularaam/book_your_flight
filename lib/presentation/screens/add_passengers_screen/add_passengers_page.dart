import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/flight.dart';
import '../../../data/models/passenger.dart';
import '../../../logic/cubit/passengers_cubit/passengers_cubit.dart';
import '../../router/app_router.dart';
import 'widgets/add_passenger_view.dart';

class AppPassengersPage extends StatefulWidget {
  final Flight flight;
  final String seatClass;
  const AppPassengersPage({
    Key? key,
    required this.flight,
    required this.seatClass,
  }) : super(key: key);

  @override
  State<AppPassengersPage> createState() => _AppPassengersPageState();
}

class _AppPassengersPageState extends State<AppPassengersPage> {
  Flight get flight => widget.flight;
  String get seatClass => widget.seatClass;
  List<Passenger> passengers = [];
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
                    width: 2.w,
                  ),
                  Text(
                    "Add passengers",
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
                        height: 5.h,
                      ),
                      const AddPassengerView(),
                      SizedBox(
                        height: 5.h,
                      ),
                      BlocBuilder<PassengersCubit, PassengersState>(
                        builder: (context, state) {
                          if (state is PassengersShow) {
                            passengers = state.passengers;
                            return ListView.builder(
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
                                            borderRadius:
                                                BorderRadius.circular(2.w)),
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
                                            TextButton(
                                              onPressed: () => BlocProvider.of<
                                                      PassengersCubit>(context)
                                                  .removePassenger(
                                                      id: passenger.id),
                                              child: const Icon(
                                                Icons.remove_circle_outlined,
                                                color: AppColors.primaryColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                    ],
                                  );
                                });
                          }
                          return Container();
                        },
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Go to checkout",
                        style: TextStyle(
                          color: AppColors.lightColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, AppRouter.flightDetailsPage, arguments: {
                        "flight": flight,
                        "seatClass": seatClass,
                        "passengers": passengers
                      }),
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: AppColors.lightColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
