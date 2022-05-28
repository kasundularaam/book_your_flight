import 'dart:developer';

import 'package:book_your_flight/data/models/flight_params.dart';
import 'package:book_your_flight/logic/cubit/select_class_cubit/select_class_cubit.dart';
import 'package:book_your_flight/presentation/router/app_router.dart';
import 'package:book_your_flight/presentation/screens/home_screen/widgets/nonstop_flight_filter_switch.dart';
import 'package:book_your_flight/presentation/screens/home_screen/widgets/search_flights_button.dart';
import 'package:book_your_flight/presentation/screens/home_screen/widgets/select_class_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/strings.dart';
import '../../../logic/cubit/booking_type_cubit/booking_type_cubit.dart';
import '../../../logic/cubit/select_city_cubit/select_place_cubit.dart';
import 'widgets/date_view.dart';
import 'widgets/selected_city_view.dart';
import 'widgets/booking_type_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String origin = "";
  String destination = "";
  String departDate = "";
  int tripType = 1;
  String seatClass = "";

  next() {
    log(origin);
    log(destination);
    log(departDate);
    log(seatClass);
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              Strings.profile,
                              width: 15.w,
                              height: 15.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Karam Valencia",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    "karamvalencia69@gmail.com",
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 0.1.h,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                  ),
                ),
                leading: const Icon(
                  Icons.home_rounded,
                  color: AppColors.primaryColor,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  "Current",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                  ),
                ),
                leading: const Icon(
                  Icons.book_rounded,
                  color: AppColors.primaryColor,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  "History",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                  ),
                ),
                leading: const Icon(
                  Icons.history_rounded,
                  color: AppColors.primaryColor,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
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
                          width: 10.w,
                          height: 10.w,
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
                    BlocBuilder<BookingTypeCubit, BookingTypeState>(
                      builder: (context, state) {
                        if (state is BookingTypeRoundTrip) {
                          return Row(
                            children: [
                              BookingTypeButton(
                                text: "One-Way",
                                selected: false,
                                onTap: () =>
                                    BlocProvider.of<BookingTypeCubit>(context)
                                        .selectOneWay(),
                              ),
                              BookingTypeButton(
                                text: "Round-Trip",
                                selected: true,
                                onTap: () =>
                                    BlocProvider.of<BookingTypeCubit>(context)
                                        .selectRoundTrip(),
                              ),
                            ],
                          );
                        } else {
                          return Row(
                            children: [
                              BookingTypeButton(
                                text: "One-Way",
                                selected: true,
                                onTap: () =>
                                    BlocProvider.of<BookingTypeCubit>(context)
                                        .selectOneWay(),
                              ),
                              BookingTypeButton(
                                text: "Round-Trip",
                                selected: false,
                                onTap: () =>
                                    BlocProvider.of<BookingTypeCubit>(context)
                                        .selectRoundTrip(),
                              ),
                            ],
                          );
                        }
                      },
                    )
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
                  child: ListView(
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
                            child: BlocProvider(
                              create: (context) => SelectPlaceCubit(),
                              child: SelectedCityView(
                                isFrom: true,
                                onSelected: (place) => origin = place.code,
                              ),
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
                            child: BlocProvider(
                              create: (context) => SelectPlaceCubit(),
                              child: SelectedCityView(
                                isFrom: false,
                                onSelected: (place) => destination = place.code,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      BlocBuilder<BookingTypeCubit, BookingTypeState>(
                        builder: (context, state) {
                          if (state is BookingTypeOneWay) {
                            return Center(
                              child: Text(
                                "Departure",
                                style: TextStyle(
                                  color: AppColors.darkElv1,
                                  fontSize: 12.sp,
                                ),
                              ),
                            );
                          } else {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Departure",
                                  style: TextStyle(
                                    color: AppColors.darkElv1,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  "Return",
                                  style: TextStyle(
                                    color: AppColors.darkElv1,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      BlocBuilder<BookingTypeCubit, BookingTypeState>(
                        builder: (context, state) {
                          if (state is BookingTypeOneWay) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Flexible(flex: 1, child: SizedBox()),
                                Flexible(
                                    flex: 2,
                                    child: DateView(
                                      datePicked: (date) => departDate =
                                          "${date.year}-${date.month}-${date.day}",
                                    )),
                                const Flexible(flex: 1, child: SizedBox()),
                              ],
                            );
                          } else {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    flex: 2,
                                    child: DateView(
                                      datePicked: (date) {},
                                    )),
                                const Flexible(flex: 1, child: SizedBox()),
                                Flexible(
                                    flex: 2,
                                    child: DateView(
                                      datePicked: (date) {},
                                    ))
                              ],
                            );
                          }
                        },
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
                      BlocBuilder<SelectClassCubit, SelectClassState>(
                        builder: (context, state) {
                          if (state is SelectClassElite) {
                            seatClass = "first";
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SelectClassButton(
                                  isSelected: false,
                                  text: "economy",
                                  icon:
                                      Icons.airline_seat_recline_normal_rounded,
                                  onSelected: () =>
                                      BlocProvider.of<SelectClassCubit>(context)
                                          .selectClassEconomy(),
                                ),
                                SelectClassButton(
                                  isSelected: false,
                                  text: "business",
                                  icon: Icons.person,
                                  onSelected: () =>
                                      BlocProvider.of<SelectClassCubit>(context)
                                          .selectClassBusiness(),
                                ),
                                SelectClassButton(
                                  isSelected: true,
                                  text: "first",
                                  icon: Icons.person,
                                  onSelected: () =>
                                      BlocProvider.of<SelectClassCubit>(context)
                                          .selectClassElite(),
                                ),
                              ],
                            );
                          } else if (state is SelectClassBusiness) {
                            seatClass = "business";
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SelectClassButton(
                                  isSelected: false,
                                  text: "economy",
                                  icon:
                                      Icons.airline_seat_recline_normal_rounded,
                                  onSelected: () =>
                                      BlocProvider.of<SelectClassCubit>(context)
                                          .selectClassEconomy(),
                                ),
                                SelectClassButton(
                                  isSelected: true,
                                  text: "business",
                                  icon: Icons.person,
                                  onSelected: () =>
                                      BlocProvider.of<SelectClassCubit>(context)
                                          .selectClassBusiness(),
                                ),
                                SelectClassButton(
                                  isSelected: false,
                                  text: "first",
                                  icon: Icons.person,
                                  onSelected: () =>
                                      BlocProvider.of<SelectClassCubit>(context)
                                          .selectClassElite(),
                                ),
                              ],
                            );
                          } else {
                            seatClass = "economy";
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SelectClassButton(
                                  isSelected: true,
                                  text: "economy",
                                  icon:
                                      Icons.airline_seat_recline_normal_rounded,
                                  onSelected: () =>
                                      BlocProvider.of<SelectClassCubit>(context)
                                          .selectClassEconomy(),
                                ),
                                SelectClassButton(
                                  isSelected: false,
                                  text: "business",
                                  icon: Icons.person,
                                  onSelected: () =>
                                      BlocProvider.of<SelectClassCubit>(context)
                                          .selectClassBusiness(),
                                ),
                                SelectClassButton(
                                  isSelected: false,
                                  text: "first",
                                  icon: Icons.person,
                                  onSelected: () =>
                                      BlocProvider.of<SelectClassCubit>(context)
                                          .selectClassElite(),
                                ),
                              ],
                            );
                          }
                        },
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
                        child: SearchFlightsButton(onPressed: () => next()),
                      ),
                      SizedBox(
                        height: 4.h,
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
