part of 'get_place_cubit.dart';

@immutable
abstract class GetPlaceState {}

class GetPlaceInitial extends GetPlaceState {}

class GetPlaceLoading extends GetPlaceState {}

class GetPlaceLoaded extends GetPlaceState {
  final Place place;
  GetPlaceLoaded({
    required this.place,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetPlaceLoaded && other.place == place;
  }

  @override
  int get hashCode => place.hashCode;

  @override
  String toString() => 'GetPlaceLoaded(place: $place)';
}

class GetPlaceFailed extends GetPlaceState {
  final String errorMsg;
  GetPlaceFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetPlaceFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'GetPlaceFailed(errorMsg: $errorMsg)';
}
