abstract class AuthEvents {}

class LoginEvent extends AuthEvents {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class SignUpEvent extends AuthEvents {
  final String email;
  final String password;

  SignUpEvent({required this.email, required this.password});
}
