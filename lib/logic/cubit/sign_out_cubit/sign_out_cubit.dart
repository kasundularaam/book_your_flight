import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/shared/shred_services.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutInitial());

  Future signOut() async {
    try {
      emit(SignOutLoading());
      await SharedServices.removeUser();
      emit(SignOutSucceed());
    } catch (e) {
      emit(SignOutFailed(errorMsg: e.toString()));
    }
  }
}
