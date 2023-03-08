import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skripsi/models/payment_model.dart';

class PaymentService {
  // insiasi collection payment
  final _paymentFirestore = FirebaseFirestore.instance.collection('payment');

  Future<List<PaymentModel>> fetchPayment() async {
    try {
      // mengambil seluruh data payment
      QuerySnapshot result = await _paymentFirestore.get();

      // menampilkan data list payment dalam bentuk model json
      List<PaymentModel> payments = result.docs
          .map((e) =>
              PaymentModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();
      return payments;
    } catch (e) {
      // jika terjadi error maka akan menampilkan error
      rethrow;
    }
  }
}
