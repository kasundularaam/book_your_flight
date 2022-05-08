import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:book_your_flight/core/constants/app_colors.dart';
import 'package:book_your_flight/data/models/place.dart';
import 'package:book_your_flight/logic/cubit/select_city_cubit/select_place_cubit.dart';
import 'package:book_your_flight/presentation/screens/home_screen/widgets/select_city_field.dart';

class SelectedCityView extends StatefulWidget {
  final bool isFrom;
  final Function(Place) onSelected;
  const SelectedCityView({
    Key? key,
    required this.isFrom,
    required this.onSelected,
  }) : super(key: key);
  @override
  State<SelectedCityView> createState() => _SelectedCityViewState();
}

class _SelectedCityViewState extends State<SelectedCityView> {
  Place? place;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<SelectPlaceCubit>(context).loadPlaces(),
      child: BlocListener<SelectPlaceCubit, SelectPlaceState>(
        listener: (context, state) {
          if (state is SelectPlaceLoaded) {
            showSearch(
              context: context,
              delegate: SelectCityField(
                places: state.places,
                onSelected: (selectedPlace) {
                  setState(() {
                    place = selectedPlace;
                    widget.onSelected(selectedPlace);
                  });
                },
              ),
            );
          }
        },
        child: Column(
          crossAxisAlignment:
              widget.isFrom ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(
              place != null ? place!.city : "Select",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              place != null ? place!.code : "",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 0.1.h,
              color: AppColors.darkElv0,
            ),
          ],
        ),
      ),
    );
  }
}
