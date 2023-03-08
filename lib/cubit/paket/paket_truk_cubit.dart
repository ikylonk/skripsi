import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class PaketTrukCubit extends Cubit<int> {
  var paketTruk = 0;
  // initial state is 0
  PaketTrukCubit({this.paketTruk = 0}) : super(0);

  // untuk menambahkan jumlah truk
  void increment() => emit(state + 1);

  // untuk mengurangi jumlah truk
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
      paketTruk = change.nextState * 150000;
    } else {
      paketTruk = 0;
    }
    debugPrint('PaketTrukCubit: $paketTruk');
    super.onChange(change);
  }
}
