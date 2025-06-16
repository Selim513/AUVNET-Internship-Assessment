abstract class AuthBlocState {}

class AuthInitialState extends AuthBlocState {}

class LoginSuccess extends AuthBlocState {
  final String succMessage;

  LoginSuccess({required this.succMessage});
}

class LoginFailure extends AuthBlocState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}

class LoginLoading extends AuthBlocState {}

class SignUpSuccess extends AuthBlocState {
  final String succMessage;

  SignUpSuccess({required this.succMessage});
}

class SignUpFailure extends AuthBlocState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

class SignUpLoading extends AuthBlocState {}
