import 'package:book_your_flight/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../../data/models/booking.dart';
import '../../../../logic/cubit/booking_card_cubit/booking_card_cubit.dart';
import '../../../../logic/cubit/get_place_cubit/get_place_cubit.dart';
import 'city_view.dart';

class BookingCard extends StatefulWidget {
  final Booking booking;
  const BookingCard({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  Booking get booking => widget.booking;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BookingCardCubit>(context).loadBookingCard(
        flightId: booking.flight, passengerIds: booking.passengers);
    return Column(
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(3.w),
            child: BlocBuilder<BookingCardCubit, BookingCardState>(
              builder: (context, state) {
                if (state is BookingCardLoaded) {
                  return InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, AppRouter.bookingPage, arguments: {
                      "booking": booking,
                      "passengers": state.passengers,
                      "flight": state.flight
                    }),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocProvider(
                              create: (context) => GetPlaceCubit(),
                              child: CityView(id: state.flight.origin),
                            ),
                            BlocProvider(
                              create: (context) => GetPlaceCubit(),
                              child: CityView(id: state.flight.destination),
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
                                  state.flight.depart_time,
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
                                    state.flight.duration,
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
                                  state.flight.depart_time,
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
                      ],
                    ),
                  );
                }
                return Image.asset(Strings.bookingLoading);
              },
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        )
      ],
    );
  }
}
