import 'dart:convert';
import 'dart:developer';

import 'package:book_your_flight/data/models/new_passenger.dart';
import 'package:http/http.dart' as http;

import '../../core/converters/http_list_converter.dart';
import '../data_providers/data_provider.dart';
import '../models/booking.dart';
import '../models/booking_update.dart';
import '../models/byf_user.dart';
import '../models/flight.dart';
import '../models/flight_params.dart';
import '../models/passenger.dart';
import '../models/place.dart';
import '../models/register.dart';

class HTTPServices {
  static Future<BYFUser> login(
      {required String username, required String password}) async {
    try {
      final res = await http.post(
          Uri.parse(
            DataProvider.userLogin,
          ),
          body: {"username": username, "password": password});

      if (res.statusCode == 200) {
        return BYFUser.fromJson(res.body);
      } else {
        throw "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<bool> register({required Register register}) async {
    try {
      final res = await http.post(
          Uri.parse(
            DataProvider.userRegister,
          ),
          body: register.toMap());
      if (res.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(res.body);
        if (map["status"] == "Error") {
          throw map["message"];
        } else {
          return true;
        }
      } else {
        throw "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<BYFUser> getUserById({required int id}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.getUserById(id),
        ),
      );

      if (res.statusCode == 200) {
        return BYFUser.fromJson(res.body);
      } else {
        throw "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<Place>> places() async {
    try {
      final res = await http.get(
        Uri.parse(DataProvider.places),
      );

      if (res.statusCode == 200) {
        return HTTPListConverter.parsePlaces(res.body);
      } else {
        throw "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Place> getPlaceById({required int id}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.getPlaceById(id),
        ),
      );

      if (res.statusCode == 200) {
        return Place.fromJson(res.body);
      } else {
        throw "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<Flight>> flights(
      {required FlightParams flightParams}) async {
    try {
      final res = await http.get(
        Uri.parse(DataProvider.flight(flightParams)),
      );
      if (res.statusCode == 200) {
        return HTTPListConverter.parseFlights(res.body);
      } else {
        throw "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Flight> getFlightById({required int id}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.getFlightById(id),
        ),
      );

      if (res.statusCode == 200) {
        return Flight.fromJson(res.body);
      } else {
        throw "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<Passenger>> passengers() async {
    try {
      final res = await http.get(
        Uri.parse(DataProvider.passenger),
      );

      if (res.statusCode == 200) {
        return HTTPListConverter.parsePassengers(res.body);
      } else {
        throw "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Passenger> addPassenger(
      {required NewPassenger newPassenger}) async {
    try {
      final res = await http.post(
          Uri.parse(
            DataProvider.passenger,
          ),
          body: newPassenger.toMap());
      if (res.statusCode == 201) {
        return Passenger.fromJson(res.body);
      } else {
        throw "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Booking> book({required Booking booking}) async {
    try {
      log(booking.toString());
      final res = await http.post(
          Uri.parse(
            DataProvider.book,
          ),
          body: booking.toJson());
      if (res.statusCode == 201) {
        return Booking.fromJson(res.body);
      } else {
        throw "An error occurred";
      }
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }

  static Future<List<Booking>> bookings() async {
    try {
      final res = await http.get(
        Uri.parse(DataProvider.book),
      );

      if (res.statusCode == 200) {
        return HTTPListConverter.parseBookings(res.body);
      } else {
        throw "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Booking> updateBooking(
      {required BookingUpdate bookingUpdate}) async {
    try {
      final res = await http.put(
          Uri.parse(
            DataProvider.book,
          ),
          body: bookingUpdate.toJson());
      if (res.statusCode == 200) {
        return Booking.fromJson(res.body);
      } else {
        throw "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
