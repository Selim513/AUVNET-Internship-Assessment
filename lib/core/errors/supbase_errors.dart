import 'package:supabase_flutter/supabase_flutter.dart';

String mapSupabaseAuthError(String? errorMessage) {
  if (errorMessage == null) return 'Something went wrong. Please try again.';

  if (errorMessage.contains('User already registered')) {
    return 'This email is already registered.';
  } else if (errorMessage.contains('Invalid login credentials')) {
    return 'Incorrect email or password.';
  } else if (errorMessage.contains('Email not confirmed')) {
    return 'Please confirm your email address.';
  } else if (errorMessage.contains('Password should be at least')) {
    return 'Password is too weak.';
  } else if (errorMessage.contains('Invalid email')) {
    return 'Enter a valid email address.';
  } else {
    return 'Authentication failed: $errorMessage';
  }
}

String extractErrorMessage(dynamic e) {
  if (e is AuthException) {
    return mapSupabaseAuthError(
      e.message,
    ); // بنجيب الرسالة من ال exception نفسه
  } else {
    return mapSupabaseAuthError(
      e.toString(),
    ); // لو مش من نوع AuthException، نطبعها كـ String
  }
}
