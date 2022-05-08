import 'package:bloc/bloc.dart';
import 'package:book_your_flight/data/http/http_services.dart';
import 'package:book_your_flight/data/models/place.dart';
import 'package:flutter/foundation.dart';

part 'select_place_state.dart';

class SelectPlaceCubit extends Cubit<SelectPlaceState> {
  SelectPlaceCubit() : super(SelectPlaceInitial());

  Future loadPlaces() async {
    try {
      emit(SelectPlaceLoading());
      List<Place> places = await HTTPServices.places();
      emit(SelectPlaceLoaded(places: places));
    } catch (e) {
      emit(SelectPlaceFailed(errorMsg: e.toString()));
    }
  }
}
