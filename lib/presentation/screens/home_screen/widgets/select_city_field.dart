import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';

class SelectCityField extends SearchDelegate {
  final Function(CityWithCode) onSelected;
  SelectCityField({
    required this.onSelected,
  });
  final List<CityWithCode> searchResults = [
    CityWithCode(city: "Sydney", code: "(SYD)"),
    CityWithCode(city: "Landon", code: "(SYD)"),
    CityWithCode(city: "Katunayake", code: "(SYD)"),
  ];
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
    List<CityWithCode> suggestions = searchResults.where((searchResult) {
      final String result = searchResult.city.toLowerCase();
      final String input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: ((context, index) {
        final CityWithCode suggestion = suggestions[index];
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
          subtitle: Text(
            suggestion.code,
            style: TextStyle(
              color: AppColors.darkElv1,
              fontSize: 12.sp,
            ),
          ),
        );
      }),
    );
  }
}

class CityWithCode {
  final String city;
  final String code;
  CityWithCode({
    required this.city,
    required this.code,
  });

  CityWithCode copyWith({
    String? city,
    String? code,
  }) {
    return CityWithCode(
      city: city ?? this.city,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'code': code,
    };
  }

  factory CityWithCode.fromMap(Map<String, dynamic> map) {
    return CityWithCode(
      city: map['city'] ?? '',
      code: map['code'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CityWithCode.fromJson(String source) =>
      CityWithCode.fromMap(json.decode(source));

  @override
  String toString() => 'CityWithCode(city: $city, code: $code)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CityWithCode && other.city == city && other.code == code;
  }

  @override
  int get hashCode => city.hashCode ^ code.hashCode;
}
