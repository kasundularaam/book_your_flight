part of 'add_passenger_cubit.dart';

@immutable
abstract class AddPassengerState {}

class AddPassengerInitial extends AddPassengerState {}

class AddPassengerLoading extends AddPassengerState {}

class AddPassengerSucceed extends AddPassengerState {
  final Passenger passenger;
  AddPassengerSucceed({
    required this.passenger,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddPassengerSucceed && other.passenger == passenger;
  }

  @override
  int get hashCode => passenger.hashCode;

  @override
  String toString() => 'AddPassengerSucceed(passenger: $passenger)';
}

class AddPassengerFailed extends AddPassengerState {
  final String errorMsg;
  AddPassengerFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddPassengerFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'AddPassengerFailed(errorMsg: $errorMsg)';
}
