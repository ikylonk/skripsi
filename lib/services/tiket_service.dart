import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skripsi/models/tiket_model.dart';

class TiketService {
  final _tiketFirestore = FirebaseFirestore.instance.collection("tikets");

  Future<List<TiketModel>> fetchTiket() async {
    try {
      QuerySnapshot result = await _tiketFirestore.get();

      List<TiketModel> tikets = result.docs
          .map((e) =>
              TiketModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();
      return tikets;
    } catch (e) {
      rethrow;
    }
  }
}
