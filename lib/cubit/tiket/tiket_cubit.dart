import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skripsi/models/tiket_model.dart';
import 'package:skripsi/services/tiket_service.dart';

part 'tiket_state.dart';

class TiketCubit extends Cubit<TiketState> {
  TiketCubit() : super(TiketInitial());

  Future<void> fetchTiket() async {
    try {
      emit(TiketLoading());
      List<TiketModel> tikets = await TiketService().fetchTiket();
      emit(TiketSuccess(tikets));
    } catch (e) {
      emit(TiketFailed(e.toString()));
    }
  }
}
