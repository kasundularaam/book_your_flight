import 'package:book_your_flight/core/constants/configs.dart';
import 'package:book_your_flight/data/models/flight_params.dart';

class DataProvider {
  static String get userRegister => "$baseUrl/user";
  static String get userLogin => "$baseUrl/auth";
  static String getUserById(int id) => "$baseUrl/user/$id";
  static String get places => "$baseUrl/place";
  static String getPlaceById(int id) => "$baseUrl/place/$id";
  static String flight(FlightParams flight) =>
      "$baseUrl/flight?Origin=${flight.origin}&Destination=${flight.destination}&DepartDate=${flight.departDate}&TripType=1&SeatClass=${flight.seatClass}";
  static String getFlightById(int id) => "$baseUrl/flight/$id";
  static String get passenger => "$baseUrl/passenger/";
  static String get book => "$baseUrl/flight/ticket/book";
  static String updateBooking(int id) => "$baseUrl/flight/ticket/book/$id";
}
