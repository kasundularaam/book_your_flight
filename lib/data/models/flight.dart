import 'dart:convert';

class Flight {
  final int id;
  final int origin;
  final int destination;
  final String depart_time;
  final String duration;
  final String arrival_time;
  final String plane;
  final String airline;
  final double economy_fare;
  final double business_fare;
  final double first_fare;
  Flight({
    required this.id,
    required this.origin,
    required this.destination,
    required this.depart_time,
    required this.duration,
    required this.arrival_time,
    required this.plane,
    required this.airline,
    required this.economy_fare,
    required this.business_fare,
    required this.first_fare,
  });

  Flight copyWith({
    int? id,
    int? origin,
    int? destination,
    String? depart_time,
    String? duration,
    String? arrival_time,
    String? plane,
    String? airline,
    double? economy_fare,
    double? business_fare,
    double? first_fare,
  }) {
    return Flight(
      id: id ?? this.id,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      depart_time: depart_time ?? this.depart_time,
      duration: duration ?? this.duration,
      arrival_time: arrival_time ?? this.arrival_time,
      plane: plane ?? this.plane,
      airline: airline ?? this.airline,
      economy_fare: economy_fare ?? this.economy_fare,
      business_fare: business_fare ?? this.business_fare,
      first_fare: first_fare ?? this.first_fare,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'origin': origin,
      'destination': destination,
      'depart_time': depart_time,
      'duration': duration,
      'arrival_time': arrival_time,
      'plane': plane,
      'airline': airline,
      'economy_fare': economy_fare,
      'business_fare': business_fare,
      'first_fare': first_fare,
    };
  }

  factory Flight.fromMap(Map<String, dynamic> map) {
    return Flight(
      id: map['id']?.toInt() ?? 0,
      origin: map['origin']?.toInt() ?? 0,
      destination: map['destination']?.toInt() ?? 0,
      depart_time: map['depart_time'] ?? '',
      duration: map['duration'] ?? '',
      arrival_time: map['arrival_time'] ?? '',
      plane: map['plane'] ?? '',
      airline: map['airline'] ?? '',
      economy_fare: map['economy_fare']?.toDouble() ?? 0.0,
      business_fare: map['business_fare']?.toDouble() ?? 0.0,
      first_fare: map['first_fare']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Flight.fromJson(String source) => Flight.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Flight(id: $id, origin: $origin, destination: $destination, depart_time: $depart_time, duration: $duration, arrival_time: $arrival_time, plane: $plane, airline: $airline, economy_fare: $economy_fare, business_fare: $business_fare, first_fare: $first_fare)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Flight &&
        other.id == id &&
        other.origin == origin &&
        other.destination == destination &&
        other.depart_time == depart_time &&
        other.duration == duration &&
        other.arrival_time == arrival_time &&
        other.plane == plane &&
        other.airline == airline &&
        other.economy_fare == economy_fare &&
        other.business_fare == business_fare &&
        other.first_fare == first_fare;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        origin.hashCode ^
        destination.hashCode ^
        depart_time.hashCode ^
        duration.hashCode ^
        arrival_time.hashCode ^
        plane.hashCode ^
        airline.hashCode ^
        economy_fare.hashCode ^
        business_fare.hashCode ^
        first_fare.hashCode;
  }
}
