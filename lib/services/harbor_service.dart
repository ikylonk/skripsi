import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skripsi/models/harbor_model.dart';

class HarborService {
  // insiasi collection harbor
  final _harborFirestore = FirebaseFirestore.instance.collection('harbors');

  Future<List<HarborModel>> fetchHarbor() async {
    try {
      // mengambil seluruh data harbor
      QuerySnapshot result = await _harborFirestore.get();

      // menampilkan data list harbor dalam bentuk model json
      List<HarborModel> harbors = result.docs
          .map((e) =>
              HarborModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();
      return harbors;
    } catch (e) {
      // jika terjadi error maka akan menampilkan error
      rethrow;
    }
  }
}
