import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skripsi/models/user_model.dart';
import 'package:skripsi/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late String? name = "";
  late String? userId = "";

  AuthCubit() : super(AuthInitial());

  Future<void> signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel userModel =
          await AuthService().signIn(email: email, password: password);
      emit(AuthSuccess(userModel));
      name = userModel.name;
      userId = userModel.id;
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  Future<void> singUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      emit(AuthLoading());
      UserModel userModel = await AuthService()
          .signUp(email: email, password: password, name: name);
      emit(AuthSuccess(userModel));
      name = userModel.name;
      userId = userModel.id;
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      AuthLoading();
      UserCredential userCredential = await AuthService().signInWithGoogle();
      emit(AuthGoogleSuccess(userCredential));
      name = userCredential.user?.displayName;
      userId = userCredential.user?.uid;
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
