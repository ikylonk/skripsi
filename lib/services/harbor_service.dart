import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skripsi/models/harbor_model.dart';

class HarborService {
  final _harborFirestore = FirebaseFirestore.instance.collection('harbors');

  Future<List<HarborModel>> fetchHarbor() async {
    try {
      QuerySnapshot result = await _harborFirestore.get();

      List<HarborModel> harbors = result.docs
          .map((e) =>
              HarborModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();
      return harbors;
    } catch (e) {
      rethrow;
    }
  }
}
