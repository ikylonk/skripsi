import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class PaketMotorCubit extends Cubit<int> {
  var paketMotor = 0;
  // initial state is 0
  PaketMotorCubit({this.paketMotor = 0}) : super(0);

  // untuk menambahkan jumlah motor
  void increment() => emit(state + 1);

  // untuk mengurangi jumlah motor
  void decrement() {
    if (state > 0) {
      emit(state - 1);
    } else {
      emit(0);
    }
  }

  @override
  // fungsi ini akan dipanggil setiap kali state berubah
  void onChange(Change<int> change) {
    if (change.nextState > 0) {
      paketMotor = change.nextState * 50000;
    } else {
      paketMotor = 0;
    }
    debugPrint('PaketMotorCubit: $paketMotor');
    super.onChange(change);
  }
}
