import 'dart:convert';

class Passenger {
  final int id;
  final String first_name;
  final String last_name;
  final String gender;
  Passenger({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.gender,
  });

  Passenger copyWith({
    int? id,
    String? first_name,
    String? last_name,
    String? gender,
  }) {
    return Passenger(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'gender': gender,
    };
  }

  factory Passenger.fromMap(Map<String, dynamic> map) {
    return Passenger(
      id: map['id']?.toInt() ?? 0,
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      gender: map['gender'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Passenger.fromJson(String source) =>
      Passenger.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Passenger(id: $id, first_name: $first_name, last_name: $last_name, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Passenger &&
        other.id == id &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        first_name.hashCode ^
        last_name.hashCode ^
        gender.hashCode;
  }
}
