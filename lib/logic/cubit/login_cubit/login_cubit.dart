import 'package:bloc/bloc.dart';
import 'package:book_your_flight/data/http/http_services.dart';
import 'package:book_your_flight/data/models/byf_user.dart';
import 'package:book_your_flight/data/shared/shred_services.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future login({required String username, required String password}) async {
    try {
      emit(LoginLoading());
      BYFUser user =
          await HTTPServices.login(username: username, password: password);
      await SharedServices.addUser(uid: user.id);
      emit(LoginSucceed(user: user));
    } catch (e) {
      emit(LoginFailed(errorMsg: e.toString()));
    }
  }
}
