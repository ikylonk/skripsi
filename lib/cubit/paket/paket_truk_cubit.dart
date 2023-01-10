import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class PaketTrukCubit extends Cubit<int> {
  var paketTruk = 0;
  PaketTrukCubit({this.paketTruk = 0}) : super(0);

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
      paketTruk = change.nextState * 150000;
    } else {
      paketTruk = 0;
    }
    debugPrint('PaketTrukCubit: $paketTruk');
    super.onChange(change);
  }
}
