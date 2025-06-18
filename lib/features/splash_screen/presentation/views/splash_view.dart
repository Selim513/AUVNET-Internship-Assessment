import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
import 'package:auvnet_flutter_assessment/core/utils/route_services.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/bottom_nav_bar.dart';
import 'package:auvnet_flutter_assessment/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final supabase = getIt.get<SupabaseClient>();

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    final session = supabase.auth.currentSession;

    if (!mounted) return;

    if (session != null) {
      AppRouteServices.pushReplaceMent(context, page: const BottomNavBar());
    } else {
      AppRouteServices.pushReplaceMent(context, page: const OnboardingView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/nawel.png'),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
