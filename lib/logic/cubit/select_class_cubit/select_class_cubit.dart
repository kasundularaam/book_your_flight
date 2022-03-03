import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_class_state.dart';

class SelectClassCubit extends Cubit<SelectClassState> {
  SelectClassCubit() : super(SelectClassEconomy());

  selectClassEconomy() => emit(SelectClassEconomy());
  selectClassBusiness() => emit(SelectClassBusiness());
  selectClassElite() => emit(SelectClassElite());
}
