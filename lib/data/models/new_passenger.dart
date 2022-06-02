import 'dart:convert';

class NewPassenger {
  final String first_name;
  final String last_name;
  final String gender;
  NewPassenger({
    required this.first_name,
    required this.last_name,
    required this.gender,
  });

  NewPassenger copyWith({
    String? first_name,
    String? last_name,
    String? gender,
  }) {
    return NewPassenger(
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': first_name,
      'last_name': last_name,
      'gender': gender,
    };
  }

  factory NewPassenger.fromMap(Map<String, dynamic> map) {
    return NewPassenger(
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      gender: map['gender'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewPassenger.fromJson(String source) =>
      NewPassenger.fromMap(json.decode(source));

  @override
  String toString() =>
      'NewPassenger(first_name: $first_name, last_name: $last_name, gender: $gender)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewPassenger &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.gender == gender;
  }

  @override
  int get hashCode =>
      first_name.hashCode ^ last_name.hashCode ^ gender.hashCode;
}
