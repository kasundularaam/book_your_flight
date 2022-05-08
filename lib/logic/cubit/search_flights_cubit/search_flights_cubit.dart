import 'package:bloc/bloc.dart';
import 'package:book_your_flight/data/http/http_services.dart';
import 'package:book_your_flight/data/models/flight.dart';
import 'package:book_your_flight/data/models/flight_params.dart';
import 'package:flutter/foundation.dart';

part 'search_flights_state.dart';

class SearchFlightsCubit extends Cubit<SearchFlightsState> {
  SearchFlightsCubit() : super(SearchFlightsInitial());

  Future searchFlights({required FlightParams flightParams}) async {
    try {
      emit(SearchFlightsLoading());
      List<Flight> flights =
          await HTTPServices.flights(flightParams: flightParams);
      emit(SearchFlightsLoaded(flights: flights));
    } catch (e) {
      emit(SearchFlightsFailed(errorMsg: e.toString()));
    }
  }
}
