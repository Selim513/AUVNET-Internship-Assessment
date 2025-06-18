import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
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
  var userClint = Supabase.instance.client;
  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final res = await getIt.get<SupabaseClient>().auth.signInWithPassword(
      
      password: password,
      email: email,
    );

    return res;
  }

  @override
  Future<AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final res = getIt.get<SupabaseClient>().auth.signUp(
      password: password,
      email: email,
      data: {'Name': name},
    );
    return res;
  }
}
