import 'dart:convert';

class Register {
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  Register({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
  });

  Register copyWith({
    String? first_name,
    String? last_name,
    String? email,
    String? password,
  }) {
    return Register(
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
    };
  }

  factory Register.fromMap(Map<String, dynamic> map) {
    return Register(
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Register.fromJson(String source) =>
      Register.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Register(first_name: $first_name, last_name: $last_name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Register &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return first_name.hashCode ^
        last_name.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
