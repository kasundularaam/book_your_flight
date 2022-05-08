import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/place.dart';

class SelectCityField extends SearchDelegate {
  final Function(Place) onSelected;
  final List<Place> places;
  SelectCityField({
    required this.onSelected,
    required this.places,
  });
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = "";
          }
        },
        icon: const Icon(
          Icons.clear_rounded,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(
        Icons.arrow_back_rounded,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Place> suggestions = places.where((place) {
      final String result = place.city.toLowerCase();
      final String input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: ((context, index) {
        final Place suggestion = suggestions[index];
        return ListTile(
          onTap: () {
            onSelected(suggestion);
            close(context, null);
          },
          title: Text(
            suggestion.city,
            style: TextStyle(
              color: AppColors.darkElv0,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                suggestion.country,
                style: TextStyle(
                  color: AppColors.darkElv1,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                suggestion.code,
                style: TextStyle(
                  color: AppColors.darkElv1,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
