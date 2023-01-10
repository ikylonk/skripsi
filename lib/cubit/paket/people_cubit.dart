import 'package:bloc/bloc.dart';

class PeopleCubit extends Cubit<int> {
  PeopleCubit() : super(1);

  void increment() => emit(state + 1);

  void decrement() {
    if (state > 1) {
      emit(state - 1);
    } else {
      emit(1);
    }
  }
}
