import 'dart:convert';

import 'package:flutter/foundation.dart';

class BookingUpdate {
  final String ref_no;
  final List<int> passengers;
  final String seat_class;
  final String status;
  BookingUpdate({
    required this.ref_no,
    required this.passengers,
    required this.seat_class,
    required this.status,
  });

  BookingUpdate copyWith({
    String? ref_no,
    List<int>? passengers,
    String? seat_class,
    String? status,
  }) {
    return BookingUpdate(
      ref_no: ref_no ?? this.ref_no,
      passengers: passengers ?? this.passengers,
      seat_class: seat_class ?? this.seat_class,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ref_no': ref_no,
      'passengers': passengers,
      'seat_class': seat_class,
      'status': status,
    };
  }

  factory BookingUpdate.fromMap(Map<String, dynamic> map) {
    return BookingUpdate(
      ref_no: map['ref_no'] ?? '',
      passengers: List<int>.from(map['passengers']),
      seat_class: map['seat_class'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingUpdate.fromJson(String source) =>
      BookingUpdate.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookingUpdate(ref_no: $ref_no, passengers: $passengers, seat_class: $seat_class, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookingUpdate &&
        other.ref_no == ref_no &&
        listEquals(other.passengers, passengers) &&
        other.seat_class == seat_class &&
        other.status == status;
  }

  @override
  int get hashCode {
    return ref_no.hashCode ^
        passengers.hashCode ^
        seat_class.hashCode ^
        status.hashCode;
  }
}
