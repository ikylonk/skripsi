import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class PaketMakanCubit extends Cubit<int> {
  var paketMakan = 0;
  PaketMakanCubit({this.paketMakan = 0}) : super(0);

  void increment() => emit(state + 1);

  void decrement() {
    if (state > 0) {
      emit(state - 1);
    } else {
      emit(0);
    }
  }

  @override
  void onChange(Change<int> change) {
    if (change.nextState > 0) {
      paketMakan = change.nextState * 15000;
    } else {
      paketMakan = 0;
    }
    debugPrint('PaketMakanCubit: $paketMakan');
    super.onChange(change);
  }
}
