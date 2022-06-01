import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/place.dart';
import 'select_city_field.dart';

class SelectedCityView extends StatefulWidget {
  final bool isFrom;
  final Function(Place) onSelected;
  final List<Place> places;
  const SelectedCityView({
    Key? key,
    required this.isFrom,
    required this.onSelected,
    required this.places,
  }) : super(key: key);
  @override
  State<SelectedCityView> createState() => _SelectedCityViewState();
}

class _SelectedCityViewState extends State<SelectedCityView> {
  Place? place;
  List<Place> get places => widget.places;
  onSelected(Place value) => widget.onSelected(value);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSearch(
        context: context,
        delegate: SelectCityField(
          places: places,
          onSelected: (selectedPlace) {
            setState(() {
              place = selectedPlace;
              onSelected(selectedPlace);
            });
          },
        ),
      ),
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
    );
  }
}
