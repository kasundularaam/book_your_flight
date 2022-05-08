part of 'search_flights_cubit.dart';

@immutable
abstract class SearchFlightsState {}

class SearchFlightsInitial extends SearchFlightsState {}

class SearchFlightsLoading extends SearchFlightsState {}

class SearchFlightsLoaded extends SearchFlightsState {
  final List<Flight> flights;
  SearchFlightsLoaded({
    required this.flights,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchFlightsLoaded && listEquals(other.flights, flights);
  }

  @override
  int get hashCode => flights.hashCode;

  @override
  String toString() => 'SearchFlightsLoaded(flights: $flights)';
}

class SearchFlightsFailed extends SearchFlightsState {
  final String errorMsg;
  SearchFlightsFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchFlightsFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'SearchFlightsFailed(errorMsg: $errorMsg)';
}
