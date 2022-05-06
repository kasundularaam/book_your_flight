import 'dart:convert';

class Place {
  final int id;
  final String code;
  final String city;
  final String country;
  Place({
    required this.id,
    required this.code,
    required this.city,
    required this.country,
  });

  Place copyWith({
    int? id,
    String? code,
    String? city,
    String? country,
  }) {
    return Place(
      id: id ?? this.id,
      code: code ?? this.code,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'city': city,
      'country': country,
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      id: map['id']?.toInt() ?? 0,
      code: map['code'] ?? '',
      city: map['city'] ?? '',
      country: map['country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) => Place.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Place(id: $id, code: $code, city: $city, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Place &&
        other.id == id &&
        other.code == code &&
        other.city == city &&
        other.country == country;
  }

  @override
  int get hashCode {
    return id.hashCode ^ code.hashCode ^ city.hashCode ^ country.hashCode;
  }
}
