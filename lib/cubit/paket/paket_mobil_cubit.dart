import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class PaketMobilCubit extends Cubit<int> {
  var paketMobil = 0;
  // initial state is 0
  PaketMobilCubit({this.paketMobil = 0}) : super(0);

  // untuk menambahkan jumlah mobil
  void increment() => emit(state + 1);

  // untuk mengurangi jumlah mobil
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
      paketMobil = change.nextState * 100000;
    } else {
      paketMobil = 0;
    }
    debugPrint('PaketMobilCubit: $paketMobil');
    super.onChange(change);
  }
}
