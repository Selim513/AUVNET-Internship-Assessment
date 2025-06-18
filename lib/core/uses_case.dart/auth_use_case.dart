abstract class AuthUseCases<Type, Param> {
  Future<Type> call(Param params);
}

class NoParam {}

class LoginParams {
  final String email;
  final String password;
  LoginParams({required this.email, required this.password});
}

class RegisterParams {
  final String name;
  final String email;
  final String password;
  RegisterParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
