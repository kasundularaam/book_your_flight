import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'booking_type_state.dart';

class BookingTypeCubit extends Cubit<BookingTypeState> {
  BookingTypeCubit() : super(BookingTypeRoundTrip());

  selectRoundTrip() => emit(BookingTypeRoundTrip());
  selectOneWay() => emit(BookingTypeOneWay());
}
