import 'package:bloc/bloc.dart';
import 'package:book_your_flight/data/shared/shred_services.dart';
import 'package:meta/meta.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingInitial());

  Future loadApp() async {
    try {
      emit(LandingLoading());
      bool isUserIn = await SharedServices.isUserIn();
      if (isUserIn) {
        emit(LandingToHome());
      } else {
        emit(LandingToAuth());
      }
    } catch (e) {
      emit(LandingFailed(errorMsg: e.toString()));
    }
  }
}
