import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skripsi/models/payment_model.dart';
import 'package:skripsi/services/payment_service.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  Future<void> fetchPayment() async {
    try {
      emit(PaymentLoading());
      List<PaymentModel> payments = await PaymentService().fetchPayment();
      emit(PaymentSuccess(payments));
    } catch (e) {
      emit(PaymentFailed(e.toString()));
    }
  }
}
