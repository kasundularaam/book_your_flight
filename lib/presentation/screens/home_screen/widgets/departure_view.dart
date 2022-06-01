import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../logic/cubit/booking_type_cubit/booking_type_cubit.dart';
import 'date_view.dart';

class DepartureView extends StatelessWidget {
  final Function(String) onSelect;
  const DepartureView({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        datePicked: (date) =>
                            onSelect("${date.year}-${date.month}-${date.day}"),
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
                    ),
                  )
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
