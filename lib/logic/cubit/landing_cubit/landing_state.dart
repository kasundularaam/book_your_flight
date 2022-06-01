part of 'landing_cubit.dart';

@immutable
abstract class LandingState {}

class LandingInitial extends LandingState {}

class LandingLoading extends LandingState {}

class LandingToHome extends LandingState {
  final BYFUser user;
  LandingToHome({
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LandingToHome && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'LandingToHome(user: $user)';
}

class LandingToAuth extends LandingState {}

class LandingFailed extends LandingState {
  final String errorMsg;
  LandingFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LandingFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'LandingFailed(errorMsg: $errorMsg)';
}
