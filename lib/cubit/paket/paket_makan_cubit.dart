import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class PaketMakanCubit extends Cubit<int> {
  var paketMakan = 0;

  // initial state is 0
  PaketMakanCubit({this.paketMakan = 0}) : super(0);

  // untuk menambahkan jumlah makanan
  void increment() => emit(state + 1);

  // untuk mengurangi jumlah makanan
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
      paketMakan = change.nextState * 15000;
    } else {
      paketMakan = 0;
    }
    debugPrint('PaketMakanCubit: $paketMakan');
    super.onChange(change);
  }
}
