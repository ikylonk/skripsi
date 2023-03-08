import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skripsi/models/tiket_model.dart';

class TiketService {
  // inisiasi collection tiket
  final _tiketFirestore = FirebaseFirestore.instance.collection("tikets");
  // inisiasi collection trasaction
  final _transactionFirestore =
      FirebaseFirestore.instance.collection('transactions');

  Future<List<TiketModel>> fetchTiket() async {
    try {
      // mengambil seluruh data tiket
      QuerySnapshot result = await _tiketFirestore.get();
      // mengambil data totalPerson transaction
      QuerySnapshot resultTrasanction =
          await _transactionFirestore.orderBy('totalPerson').get();

      if (resultTrasanction.docs.length >= 15) {
        // jika data transaction lebih dari 15 maka akan mengambil data list tiket yang kosong
        return [];
      } else {
        // menampilkan data list tiket dalam bentuk model json
        List<TiketModel> tikets = result.docs
            .map((e) =>
                TiketModel.fromJson(e.id, e.data() as Map<String, dynamic>))
            .toList();
        return tikets;
      }
    } catch (e) {
      // jika terjadi error maka akan menampilkan error
      rethrow;
    }
  }
}
