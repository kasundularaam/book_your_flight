import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../logic/cubit/get_place_cubit/get_place_cubit.dart';

class CityView extends StatelessWidget {
  final int id;
  const CityView({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetPlaceCubit>(context).getPlace(id: id);
    return BlocBuilder<GetPlaceCubit, GetPlaceState>(
      builder: (context, state) {
        if (state is GetPlaceLoaded) {
          return Text(
            "${state.place.city} (${state.place.code})",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          );
        }
        return Text(
          "Loading...",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 12.sp,
          ),
        );
      },
    );
  }
}
