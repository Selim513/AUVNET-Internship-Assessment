import 'package:auvnet_flutter_assessment/core/uses_case.dart/auth_use_case.dart';
import 'package:auvnet_flutter_assessment/features/auth/domain/repo/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupUseCase extends AuthUseCases<AuthResponse, RegisterParams> {
  final AuthRepo authRepo;

  SignupUseCase(this.authRepo);
  @override
  Future<AuthResponse> call(RegisterParams registerParams) async {
    return await authRepo.signUp(
      name: registerParams.name,
      email: registerParams.email,
      password: registerParams.password,
    );
  }
}
