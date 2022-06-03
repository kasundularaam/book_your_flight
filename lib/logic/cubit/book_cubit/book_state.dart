part of 'book_cubit.dart';

@immutable
abstract class BookState {}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookSucceed extends BookState {}

class BookFailed extends BookState {
  final String errorMsg;
  BookFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'BookFailed(errorMsg: $errorMsg)';
}
