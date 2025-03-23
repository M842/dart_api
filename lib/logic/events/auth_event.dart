
abstract class AuthEvent {}

class LoginUser extends AuthEvent {
  late final String email,password;

  LoginUser({required this.email,required this.password});
}
