import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login({required String email, required String password});
  Future<AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final user = Supabase.instance.client.auth;
  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final res = await user.signInWithPassword(password: password, email: email);
    return res;
  }

  @override
  Future<AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final res = await user.signUp(
      password: password,
      email: email,
      data: {'Name': name},
    );
    return res;
  }
}
