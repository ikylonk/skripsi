import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skripsi/firebase_options.dart';
import 'package:skripsi/models/user_model.dart';
import 'package:skripsi/services/user_service.dart';

class AuthService {
  // insiasi collection firebase authentikasi
  final _firebaseAuth = FirebaseAuth.instance;

  // fungsi untuk login dengan email dan password
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      UserModel userModel =
          await UserService().getUserById(userCredential.user!.uid);
      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  // fungsi untuk login dengan email dan password
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        role: 'customer',
      );

      await UserService().setUser(userModel);
      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  // fungsi untuk logout
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  // fungsi untuk login dengan google
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
              clientId: DefaultFirebaseOptions.currentPlatform.iosClientId)
          .signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }
}
