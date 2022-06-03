import 'dart:convert';

class BYFUser {
  final int id;
  final String username;
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  BYFUser({
    required this.id,
    required this.username,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
  });

  BYFUser copyWith({
    int? id,
    String? username,
    String? first_name,
    String? last_name,
    String? email,
    String? password,
  }) {
    return BYFUser(
      id: id ?? this.id,
      username: username ?? this.username,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
    };
  }

  factory BYFUser.fromMap(Map<String, dynamic> map) {
    return BYFUser(
      id: map['id']?.toInt() ?? -1,
      username: map['username'] ?? '',
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BYFUser.fromJson(String source) =>
      BYFUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BYFUser(id: $id, username: $username, first_name: $first_name, last_name: $last_name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BYFUser &&
        other.id == id &&
        other.username == username &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        first_name.hashCode ^
        last_name.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
