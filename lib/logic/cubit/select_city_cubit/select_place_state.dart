part of 'select_place_cubit.dart';

@immutable
abstract class SelectPlaceState {}

class SelectPlaceInitial extends SelectPlaceState {}

class SelectPlaceLoading extends SelectPlaceState {}

class SelectPlaceLoaded extends SelectPlaceState {
  final List<Place> places;
  SelectPlaceLoaded({
    required this.places,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelectPlaceLoaded && listEquals(other.places, places);
  }

  @override
  int get hashCode => places.hashCode;

  @override
  String toString() => 'SelectPlaceLoaded(places: $places)';
}

class SelectPlaceFailed extends SelectPlaceState {
  final String errorMsg;
  SelectPlaceFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelectPlaceFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'SelectPlaceFailed(errorMsg: $errorMsg)';
}
