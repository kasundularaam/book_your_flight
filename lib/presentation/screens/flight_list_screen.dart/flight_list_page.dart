import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:book_your_flight/core/constants/app_colors.dart';
import 'package:book_your_flight/data/models/flight_params.dart';
import 'package:book_your_flight/presentation/screens/flight_list_screen.dart/widgets/details_card.dart';

import '../../../logic/cubit/search_flights_cubit/search_flights_cubit.dart';

class FlightListPage extends StatefulWidget {
  final FlightParams flightParams;
  const FlightListPage({
    Key? key,
    required this.flightParams,
  }) : super(key: key);

  @override
  State<FlightListPage> createState() => _FlightListPageState();
}

class _FlightListPageState extends State<FlightListPage> {
  FlightParams get flightParams => widget.flightParams;
  String dropdownValue = 'Price';

  var items = [
    'Price',
    'Time',
  ];
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchFlightsCubit>(context)
        .searchFlights(flightParams: flightParams);
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
                          "${flightParams.origin} - ${flightParams.destination}",
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
                          flightParams.departDate,
                          style: TextStyle(
                            color: AppColors.darkElv1,
                            fontSize: 12.sp,
                          ),
                        ),
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
                child: BlocConsumer<SearchFlightsCubit, SearchFlightsState>(
                  listener: (context, state) {
                    if (state is SearchFlightsFailed) {
                      SnackBar snackBar =
                          SnackBar(content: Text(state.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  builder: (context, state) {
                    if (state is SearchFlightsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor),
                      );
                    }
                    if (state is SearchFlightsLoaded) {
                      return ListView(
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
                                    color:
                                        AppColors.lightColor.withOpacity(0.7),
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
                            "${state.flights.length} Flights are available Sydney to London",
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
                            itemCount: state.flights.length,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) =>
                                DetailsCard(flight: state.flights[index])),
                          ),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
