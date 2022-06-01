import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubit/booking_type_cubit/booking_type_cubit.dart';
import 'booking_type_button.dart';

class BookingTypeBtnView extends StatelessWidget {
  const BookingTypeBtnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingTypeCubit, BookingTypeState>(
      builder: (context, state) {
        if (state is BookingTypeRoundTrip) {
          return Row(
            children: [
              BookingTypeButton(
                text: "One-Way",
                selected: false,
                onTap: () =>
                    BlocProvider.of<BookingTypeCubit>(context).selectOneWay(),
              ),
              BookingTypeButton(
                text: "Round-Trip",
                selected: true,
                onTap: () => BlocProvider.of<BookingTypeCubit>(context)
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
                    BlocProvider.of<BookingTypeCubit>(context).selectOneWay(),
              ),
              BookingTypeButton(
                text: "Round-Trip",
                selected: false,
                onTap: () => BlocProvider.of<BookingTypeCubit>(context)
                    .selectRoundTrip(),
              ),
            ],
          );
        }
      },
    );
  }
}
