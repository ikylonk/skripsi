import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skripsi/models/user_model.dart';

class UserService {
  // insiasi collection user
  final _userFirestore = FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel userModel) async {
    try {
        // menambahkan data user ke collection user
      _userFirestore.doc(userModel.id).set({
        'email': userModel.email,
        'name': userModel.name,
        'role': userModel.role,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      // mengambil data user berdasarkan id
      final DocumentSnapshot snapshot = await _userFirestore.doc(id).get();
      return UserModel(
          id: id,
          email: snapshot['email'],
          name: snapshot['name'],
          role: snapshot['role']);
    } catch (e) {
      rethrow;
    }
  }
}
