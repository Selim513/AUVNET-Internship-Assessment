abstract class AuthEvents {}

class LoginEent extends AuthEvents {
  final String email;
  final String password;

  LoginEent({required this.email, required this.password});
}

class SignUpEvent extends AuthEvents {
  final String email;
  final String password;

  SignUpEvent({required this.email, required this.password});
}
