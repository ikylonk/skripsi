part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthFailed extends AuthState {
  final String error;
  const AuthFailed(this.error);

  @override
  List<Object?> get props => [error];
}

class AuthSuccess extends AuthState {
  final UserModel userModel;
  const AuthSuccess(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class AuthGoogleSuccess extends AuthState {
  final UserCredential userCredential;
  const AuthGoogleSuccess(this.userCredential);

  @override
  List<Object?> get props => [userCredential];
}
