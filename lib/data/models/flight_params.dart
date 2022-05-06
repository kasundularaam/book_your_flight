import 'dart:convert';

class FlightParams {
  final String origin;
  final String destination;
  final String departDate;
  final int tripType;
  final String seatClass;
  FlightParams({
    required this.origin,
    required this.destination,
    required this.departDate,
    required this.tripType,
    required this.seatClass,
  });

  FlightParams copyWith({
    String? origin,
    String? destination,
    String? departDate,
    int? tripType,
    String? seatClass,
  }) {
    return FlightParams(
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      departDate: departDate ?? this.departDate,
      tripType: tripType ?? this.tripType,
      seatClass: seatClass ?? this.seatClass,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'origin': origin,
      'destination': destination,
      'departDate': departDate,
      'tripType': tripType,
      'seatClass': seatClass,
    };
  }

  factory FlightParams.fromMap(Map<String, dynamic> map) {
    return FlightParams(
      origin: map['origin'] ?? '',
      destination: map['destination'] ?? '',
      departDate: map['departDate'] ?? '',
      tripType: map['tripType']?.toInt() ?? 0,
      seatClass: map['seatClass'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FlightParams.fromJson(String source) =>
      FlightParams.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FlightParams(origin: $origin, destination: $destination, departDate: $departDate, tripType: $tripType, seatClass: $seatClass)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FlightParams &&
        other.origin == origin &&
        other.destination == destination &&
        other.departDate == departDate &&
        other.tripType == tripType &&
        other.seatClass == seatClass;
  }

  @override
  int get hashCode {
    return origin.hashCode ^
        destination.hashCode ^
        departDate.hashCode ^
        tripType.hashCode ^
        seatClass.hashCode;
  }
}
