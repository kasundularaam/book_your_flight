import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/http/http_services.dart';
import '../../../data/models/byf_user.dart';
import '../../../data/shared/shred_services.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingInitial());

  Future loadApp() async {
    try {
      emit(LandingLoading());
      bool isUserIn = await SharedServices.isUserIn();
      if (isUserIn) {
        final int id = await SharedServices.getUid();
        final BYFUser user = await HTTPServices.getUserById(id: id);
        emit(LandingToHome(user: user));
      } else {
        emit(LandingToAuth());
      }
    } catch (e) {
      emit(LandingFailed(errorMsg: e.toString()));
    }
  }
}
