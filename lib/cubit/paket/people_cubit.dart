import 'package:bloc/bloc.dart';

class PeopleCubit extends Cubit<int> {
  // initial state is 1
  PeopleCubit() : super(1);

  // untuk menambahkan jumlah orang
  void increment() => emit(state + 1);

  // untuk mengurangi jumlah orang
  void decrement() {
    if (state > 1) {
      emit(state - 1);
    } else {
      emit(1);
    }
  }
}
