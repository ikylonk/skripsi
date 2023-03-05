import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skripsi/models/tiket_model.dart';
import 'package:skripsi/models/transaction_model.dart';

class TiketService {
  final _tiketFirestore = FirebaseFirestore.instance.collection("tikets");
  final _transactionFirestore =
      FirebaseFirestore.instance.collection('transactions');

  Future<List<TiketModel>> fetchTiket() async {
    try {
      QuerySnapshot result = await _tiketFirestore.get();
      QuerySnapshot resultTrasanction =
          await _transactionFirestore.orderBy('totalPerson').get();

      if (resultTrasanction.docs.length >= 5) {
        return [];
      } else {
        List<TiketModel> tikets = result.docs
            .map((e) =>
                TiketModel.fromJson(e.id, e.data() as Map<String, dynamic>))
            .toList();
        return tikets;
      }
    } catch (e) {
      rethrow;
    }
  }
}
