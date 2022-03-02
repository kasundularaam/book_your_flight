import 'package:book_your_flight/logic/cubit/booking_type_cubit/booking_type_cubit.dart';
import 'package:book_your_flight/presentation/screens/home_screen/widgets/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: 2.h,
                  ),
                  ClipOval(
                    child: Image.asset(
                      Strings.profile,
                      width: 12.w,
                      height: 12.w,
                      fit: BoxFit.cover,
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
                    height: 2.h,
                  ),
                  BlocBuilder<BookingTypeCubit, BookingTypeState>(
                    builder: (context, state) {
                      if (state is BookingTypeRoundTrip) {
                        return Row(
                          children: [
                            SwitchButton(
                              text: "Round-Trip",
                              selected: true,
                              onTap: () =>
                                  BlocProvider.of<BookingTypeCubit>(context)
                                      .selectRoundTrip(),
                            ),
                            SwitchButton(
                              text: "One-Way",
                              selected: false,
                              onTap: () =>
                                  BlocProvider.of<BookingTypeCubit>(context)
                                      .selectOneWay(),
                            )
                          ],
                        );
                      } else {
                        return Row(
                          children: [
                            SwitchButton(
                              text: "Round-Trip",
                              selected: false,
                              onTap: () =>
                                  BlocProvider.of<BookingTypeCubit>(context)
                                      .selectRoundTrip(),
                            ),
                            SwitchButton(
                              text: "One-Way",
                              selected: true,
                              onTap: () =>
                                  BlocProvider.of<BookingTypeCubit>(context)
                                      .selectOneWay(),
                            )
                          ],
                        );
                      }
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    5.w,
                  ),
                ),
              ),
              child: Center(
                child: Text("Contents Gose Here"),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
