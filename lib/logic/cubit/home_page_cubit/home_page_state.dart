part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<Place> places;
  HomePageLoaded({
    required this.places,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomePageLoaded && listEquals(other.places, places);
  }

  @override
  int get hashCode => places.hashCode;

  @override
  String toString() => 'HomePageLoaded(places: $places)';
}

class HomePageFailed extends HomePageState {
  final String errorMsg;
  HomePageFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomePageFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'HomePageFailed(errorMsg: $errorMsg)';
}
