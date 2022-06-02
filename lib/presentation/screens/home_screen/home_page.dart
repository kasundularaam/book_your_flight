import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/strings.dart';
import '../../../data/models/byf_user.dart';
import '../../../data/models/flight_params.dart';
import '../../../logic/cubit/home_page_cubit/home_page_cubit.dart';
import '../../../logic/cubit/select_class_cubit/select_class_cubit.dart';
import '../../../logic/cubit/sign_out_cubit/sign_out_cubit.dart';
import '../../router/app_router.dart';
import 'widgets/booking_type_btn_view.dart';
import 'widgets/departure_view.dart';
import 'widgets/drawer_view.dart';
import 'widgets/nonstop_flight_filter_switch.dart';
import 'widgets/search_flights_button.dart';
import 'widgets/select_class_view.dart';
import 'widgets/selected_city_view.dart';

class HomePage extends StatefulWidget {
  final BYFUser user;
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String origin = "";
  String destination = "";
  String departDate = "";
  int tripType = 1;
  String seatClass = "economy";

  BYFUser get user => widget.user;

  next() {
    if (origin.isEmpty) return;
    if (destination.isEmpty) return;
    if (departDate.isEmpty) return;
    if (seatClass.isEmpty) return;

    Navigator.pushNamed(context, AppRouter.flightListPage,
        arguments: FlightParams(
            origin: origin,
            destination: destination,
            departDate: departDate,
            tripType: tripType,
            seatClass: seatClass));
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomePageCubit>(context).loadPlaces();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        key: scaffoldKey,
        drawer: BlocProvider(
          create: (context) => SignOutCubit(),
          child: DrawerView(
            user: user,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    GestureDetector(
                      onTap: () => scaffoldKey.currentState!.openDrawer(),
                      child: ClipOval(
                        child: Image.asset(
                          Strings.profile,
                          width: 12.w,
                          height: 12.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Book",
                                style: TextStyle(
                                  color: AppColors.lightColor,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "your Flight",
                                style: TextStyle(
                                  color: AppColors.lightColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          Strings.logoShade,
                          width: 32.w,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const BookingTypeBtnView(),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.darkElv0.withOpacity(0.2),
                        offset: Offset(0, 1.w),
                        blurRadius: 1.h,
                        spreadRadius: 1.h,
                      ),
                    ],
                    color: AppColors.lightColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        5.w,
                      ),
                    ),
                  ),
                  child: BlocConsumer<HomePageCubit, HomePageState>(
                    listener: (context, state) {
                      if (state is HomePageFailed) {
                        SnackBar snackBar =
                            SnackBar(content: Text(state.errorMsg));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    builder: (context, state) {
                      if (state is HomePageLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is HomePageLoaded) {
                        return ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "From",
                                  style: TextStyle(
                                    color: AppColors.darkElv1,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  "To",
                                  style: TextStyle(
                                    color: AppColors.darkElv1,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: SelectedCityView(
                                    places: state.places,
                                    isFrom: true,
                                    onSelected: (place) => origin = place.code,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Icon(
                                    Icons.swap_horiz_rounded,
                                    color: AppColors.primaryColor,
                                    size: 30.sp,
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: SelectedCityView(
                                    places: state.places,
                                    isFrom: false,
                                    onSelected: (place) =>
                                        destination = place.code,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            DepartureView(
                              onSelect: (value) => departDate = value,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              "Class",
                              style: TextStyle(
                                color: AppColors.darkElv1,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            BlocProvider(
                              create: (context) => SelectClassCubit(),
                              child: SelectClassView(
                                onSelect: (value) => seatClass = value,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            NonstopFlightFilterSwitch(
                              onChange: (value) => print(value),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Center(
                              child:
                                  SearchFlightsButton(onPressed: () => next()),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                          ],
                        );
                      }
                      return const Center(
                        child: SizedBox(),
                      );
                    },
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
