part of 'passengers_cubit.dart';

@immutable
abstract class PassengersState {}

class PassengersInitial extends PassengersState {}

class PassengersShow extends PassengersState {
  final List<Passenger> passengers;
  PassengersShow({
    required this.passengers,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PassengersShow && listEquals(other.passengers, passengers);
  }

  @override
  int get hashCode => passengers.hashCode;

  @override
  String toString() => 'PassengersShow(passengers: $passengers)';
}

class PassengersFailed extends PassengersState {
  final String errorMsg;
  PassengersFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PassengersFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'PassengersFailed(errorMsg: $errorMsg)';
}
