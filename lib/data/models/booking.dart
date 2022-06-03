import 'dart:convert';

import 'package:flutter/foundation.dart';

class Booking {
  final int id;
  final int user;
  final String ref_no;
  final List<int> passengers;
  final int flight;
  final String flight_ddate;
  final String flight_adate;
  final double flight_fare;
  final double other_charges;
  final String coupon_used;
  final double coupon_discount;
  final double total_fare;
  final String seat_class;
  final String booking_date;
  final String mobile;
  final String email;
  final String status;
  Booking({
    required this.id,
    required this.user,
    required this.ref_no,
    required this.passengers,
    required this.flight,
    required this.flight_ddate,
    required this.flight_adate,
    required this.flight_fare,
    required this.other_charges,
    required this.coupon_used,
    required this.coupon_discount,
    required this.total_fare,
    required this.seat_class,
    required this.booking_date,
    required this.mobile,
    required this.email,
    required this.status,
  });

  Booking copyWith({
    int? id,
    int? user,
    String? ref_no,
    List<int>? passengers,
    int? flight,
    String? flight_ddate,
    String? flight_adate,
    double? flight_fare,
    double? other_charges,
    String? coupon_used,
    double? coupon_discount,
    double? total_fare,
    String? seat_class,
    String? booking_date,
    String? mobile,
    String? email,
    String? status,
  }) {
    return Booking(
      id: id ?? this.id,
      user: user ?? this.user,
      ref_no: ref_no ?? this.ref_no,
      passengers: passengers ?? this.passengers,
      flight: flight ?? this.flight,
      flight_ddate: flight_ddate ?? this.flight_ddate,
      flight_adate: flight_adate ?? this.flight_adate,
      flight_fare: flight_fare ?? this.flight_fare,
      other_charges: other_charges ?? this.other_charges,
      coupon_used: coupon_used ?? this.coupon_used,
      coupon_discount: coupon_discount ?? this.coupon_discount,
      total_fare: total_fare ?? this.total_fare,
      seat_class: seat_class ?? this.seat_class,
      booking_date: booking_date ?? this.booking_date,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user,
      'ref_no': ref_no,
      'passengers': passengers,
      'flight': flight,
      'flight_ddate': flight_ddate,
      'flight_adate': flight_adate,
      'flight_fare': flight_fare,
      'other_charges': other_charges,
      'coupon_used': coupon_used,
      'coupon_discount': coupon_discount,
      'total_fare': total_fare,
      'seat_class': seat_class,
      'booking_date': booking_date,
      'mobile': mobile,
      'email': email,
      'status': status,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id']?.toInt() ?? 0,
      user: map['user']?.toInt() ?? 0,
      ref_no: map['ref_no'] ?? '',
      passengers: List<int>.from(map['passengers']),
      flight: map['flight']?.toInt() ?? 0,
      flight_ddate: map['flight_ddate'] ?? '',
      flight_adate: map['flight_adate'] ?? '',
      flight_fare: map['flight_fare']?.toDouble() ?? 0.0,
      other_charges: map['other_charges']?.toDouble() ?? 0.0,
      coupon_used: map['coupon_used'] ?? '',
      coupon_discount: map['coupon_discount']?.toDouble() ?? 0.0,
      total_fare: map['total_fare']?.toDouble() ?? 0.0,
      seat_class: map['seat_class'] ?? '',
      booking_date: map['booking_date'] ?? '',
      mobile: map['mobile'] ?? '',
      email: map['email'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Booking(id: $id, user: $user, ref_no: $ref_no, passengers: $passengers, flight: $flight, flight_ddate: $flight_ddate, flight_adate: $flight_adate, flight_fare: $flight_fare, other_charges: $other_charges, coupon_used: $coupon_used, coupon_discount: $coupon_discount, total_fare: $total_fare, seat_class: $seat_class, booking_date: $booking_date, mobile: $mobile, email: $email, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Booking &&
        other.id == id &&
        other.user == user &&
        other.ref_no == ref_no &&
        listEquals(other.passengers, passengers) &&
        other.flight == flight &&
        other.flight_ddate == flight_ddate &&
        other.flight_adate == flight_adate &&
        other.flight_fare == flight_fare &&
        other.other_charges == other_charges &&
        other.coupon_used == coupon_used &&
        other.coupon_discount == coupon_discount &&
        other.total_fare == total_fare &&
        other.seat_class == seat_class &&
        other.booking_date == booking_date &&
        other.mobile == mobile &&
        other.email == email &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user.hashCode ^
        ref_no.hashCode ^
        passengers.hashCode ^
        flight.hashCode ^
        flight_ddate.hashCode ^
        flight_adate.hashCode ^
        flight_fare.hashCode ^
        other_charges.hashCode ^
        coupon_used.hashCode ^
        coupon_discount.hashCode ^
        total_fare.hashCode ^
        seat_class.hashCode ^
        booking_date.hashCode ^
        mobile.hashCode ^
        email.hashCode ^
        status.hashCode;
  }
}
