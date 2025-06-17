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
      if (event is LoginEvent) {
        try {
          emit(state.copyWith(isLoading: true));
          await loginUseCase.call(
            LoginParams(email: event.email, password: event.password),
          );
          emit(state.copyWith(succMessage: 'Welcome !.'));
        } catch (e) {
          emit(state.copyWith(errMessage: e.toString(), isLoading: false));
        }
        //-SignUp--
      } else if (event is SignUpEvent) {
        try {
          emit(state.copyWith(isLoading: true));
          await signupUseCase.call(
            RegisterParams(email: event.email, password: event.password),
          );
          emit(state.copyWith(succMessage: 'Confrim Your Email.'));
        } catch (e) {
          emit(state.copyWith(errMessage: e.toString()));
        }
      }
    });
  }
}
