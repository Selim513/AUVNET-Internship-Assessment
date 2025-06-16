import 'package:auvnet_flutter_assessment/core/uses_case.dart/auth_use_case.dart';
import 'package:auvnet_flutter_assessment/features/auth/domain/use_cases/login_use_case.dart';
import 'package:auvnet_flutter_assessment/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/manger/auth_bloc/auth_events.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/manger/auth_bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvents, AuthBlocState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  AuthBloc(this.loginUseCase, this.signupUseCase) : super(AuthInitialState()) {
    on<AuthEvents>((event, emit) async {
      //-Login
      if (event is LoginEent) {
        try {
          emit(LoginLoading());
          await loginUseCase.call(
            LoginParams(email: event.email, password: event.password),
          );
          emit(LoginSuccess(succMessage: 'Welcome !.'));
        } catch (e) {
          emit(LoginFailure(errMessage: e.toString()));
        }
        //-SignUp--
      } else if (event is SignUpEvent) {
        try {
          emit(SignUpLoading());
          await signupUseCase.call(
            RegisterParams(email: event.email, password: event.password),
          );
          emit(SignUpSuccess(succMessage: 'Confrim Your Email.'));
        } catch (e) {
          print('------------------------${e.toString()}');
          emit(SignUpFailure(errMessage: e.toString()));
        }
      }
    });
  }
}
