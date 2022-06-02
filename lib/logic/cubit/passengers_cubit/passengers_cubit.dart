import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/passenger.dart';

part 'passengers_state.dart';

class PassengersCubit extends Cubit<PassengersState> {
  PassengersCubit() : super(PassengersInitial());
  List<Passenger> passengers = [];
  List<int> passengerIds = [];

  addPassenger({required Passenger passenger}) {
    if (!passengerIds.contains(passenger.id)) {
      passengerIds.add(passenger.id);
      passengers.add(passenger);
    }

    emit(PassengersShow(passengers: passengers));
  }

  showPassengers() => emit(PassengersShow(passengers: passengers));
}
