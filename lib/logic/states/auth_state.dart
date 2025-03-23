abstract class AuthState {}

class AuthInit extends AuthState {}

class AuthLoading extends AuthState {}

class AuthInitSuccess extends AuthState {
  final String token;
  AuthInitSuccess(this.token);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
