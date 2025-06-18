import 'package:auvnet_flutter_assessment/core/uses_case.dart/auth_use_case.dart';
import 'package:auvnet_flutter_assessment/features/auth/domain/repo/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class LoginUseCase extends AuthUseCases<AuthResponse, LoginParams> {
  final AuthRepo authRepo;

  LoginUseCase(this.authRepo);
  @override
  Future<AuthResponse> call(LoginParams loginParam) async {
    return await authRepo.login(
      email: loginParam.email,
      password: loginParam.password,
    );
  }
}
