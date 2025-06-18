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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      var user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        AppRouteServices.pushReplaceMent(context, page: const OnboardingView());
      }
      AppRouteServices.pushReplaceMent(context, page: const BottomNavBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/nawel.png')),
    );
  }
}
