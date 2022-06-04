import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/http/http_services.dart';
import '../../../data/models/byf_user.dart';
import '../../../data/shared/shred_services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future login({required String username, required String password}) async {
    try {
      emit(LoginLoading());
      BYFUser user =
          await HTTPServices.login(username: username, password: password);
      log(user.toString());
      if (user.id != -1) {
        await SharedServices.addUser(uid: user.id);
        emit(LoginSucceed(user: user));
      } else {
        emit(LoginFailed(errorMsg: "Login failed"));
      }
    } catch (e) {
      emit(LoginFailed(errorMsg: e.toString()));
    }
  }
}
