import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/http/http_services.dart';
import '../../../data/models/new_passenger.dart';
import '../../../data/models/passenger.dart';

part 'add_passenger_state.dart';

class AddPassengerCubit extends Cubit<AddPassengerState> {
  AddPassengerCubit() : super(AddPassengerInitial());

  Future addPassenger({required NewPassenger newPassenger}) async {
    try {
      emit(AddPassengerLoading());
      final Passenger passenger =
          await HTTPServices.addPassenger(newPassenger: newPassenger);
      emit(AddPassengerSucceed(passenger: passenger));
    } catch (e) {
      emit(AddPassengerFailed(errorMsg: e.toString()));
    }
  }
}
