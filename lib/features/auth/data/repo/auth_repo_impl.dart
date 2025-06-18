import 'package:auvnet_flutter_assessment/core/errors/supbase_errors.dart';
import 'package:auvnet_flutter_assessment/features/auth/data/data_sorce/auth_remote_data_source.dart';
import 'package:auvnet_flutter_assessment/features/auth/domain/repo/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl(this.authRemoteDataSource);
  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.login(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      final errorMessage = extractErrorMessage(e.toString());
      throw errorMessage;
    }
  }

  @override
  Future<AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.signUp(
        name: name,
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      final errorMessage = extractErrorMessage(e.toString());
      throw errorMessage;
    }
  }
}
