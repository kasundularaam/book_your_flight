import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/http/http_services.dart';
import '../../../data/models/place.dart';

part 'get_place_state.dart';

class GetPlaceCubit extends Cubit<GetPlaceState> {
  GetPlaceCubit() : super(GetPlaceInitial());

  Future getPlace({required int id}) async {
    try {
      emit(GetPlaceLoading());
      final Place place = await HTTPServices.getPlaceById(id: id);
      emit(GetPlaceLoaded(place: place));
    } catch (e) {
      emit(GetPlaceFailed(errorMsg: e.toString()));
    }
  }
}
