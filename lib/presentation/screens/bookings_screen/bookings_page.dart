import 'package:book_your_flight/logic/cubit/booking_card_cubit/booking_card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/booking.dart';
import '../../../logic/cubit/bookings_cubit/bookings_cubit.dart';
import 'widgets/booking_card.dart';

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
                "Bookings",
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
                              return BlocProvider(
                                create: (context) => BookingCardCubit(),
                                child: BookingCard(booking: booking),
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
