class AuthBlocState {
  final bool isLoading;
  final String? errMessage;
  final String? succMessage;

  AuthBlocState({this.isLoading = false, this.errMessage, this.succMessage});
  AuthBlocState copyWith({
    bool? isLoading,
    String? errMessage,
    String? succMessage,
  }) {
    return AuthBlocState(
      isLoading: isLoading ?? this.isLoading,
      errMessage: errMessage ?? this.errMessage,
      succMessage: succMessage ?? this.succMessage,
    );
  }
}


