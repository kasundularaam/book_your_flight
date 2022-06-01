import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../data/http/http_services.dart';
import '../../../data/models/place.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  Future loadPlaces() async {
    try {
      emit(HomePageLoading());
      List<Place> places = await HTTPServices.places();
      emit(HomePageLoaded(places: places));
    } catch (e) {
      emit(HomePageFailed(errorMsg: e.toString()));
    }
  }
}
