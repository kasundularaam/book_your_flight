part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucceed extends LoginState {
  final BYFUser user;
  LoginSucceed({
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginSucceed && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'LoginSucceed(user: $user)';
}

class LoginFailed extends LoginState {
  final String errorMsg;
  LoginFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'LoginFailed(errorMsg: $errorMsg)';
}
