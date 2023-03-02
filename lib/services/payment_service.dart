import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skripsi/models/payment_model.dart';

class PaymentService {
  final _paymentFirestore = FirebaseFirestore.instance.collection('payment');

  Future<List<PaymentModel>> fetchPayment() async {
    try {
      QuerySnapshot result = await _paymentFirestore.get();

      List<PaymentModel> payments = result.docs
          .map((e) =>
              PaymentModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();
      return payments;
    } catch (e) {
      rethrow;
    }
  }
}
