import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skripsi/models/harbor_model.dart';
import 'package:skripsi/services/harbor_service.dart';

part 'harbor_state.dart';

class HarborCubit extends Cubit<HarborState> {
  HarborCubit() : super(HarborInitial());

  Future<void> fetchHarbor() async {
    try {
      emit(HarborLoading());
      List<HarborModel> harbor = await HarborService().fetchHarbor();
      emit(HarborSuccess(harbor));
    } catch (e) {
      emit(HarborFailed(e.toString()));
    }
  }
}
