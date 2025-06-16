import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepo {
  Future<AuthResponse> login({required String email, required String password});
  Future<AuthResponse> signUp({
    required String email,
    required String password,
  });
}
