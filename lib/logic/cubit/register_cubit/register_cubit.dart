import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/http/http_services.dart';
import '../../../data/models/byf_user.dart';
import '../../../data/models/register.dart';
import '../../../data/shared/shred_services.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future register({required Register register}) async {
    try {
      emit(RegisterLoading());
      bool succeed = await HTTPServices.register(register: register);
      BYFUser user = await HTTPServices.login(
          username: register.username, password: register.password);
      await SharedServices.addUser(uid: user.id);
      if (succeed) {
        emit(RegisterSucceed(user: user));
      }
    } catch (e) {
      emit(RegisterFailed(errorMsg: e.toString()));
    }
  }
}
