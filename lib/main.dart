import 'package:auvnet_flutter_assessment/core/observer/simple_bloc_observer.dart';
import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
import 'package:auvnet_flutter_assessment/features/splash_screen/presentation/views/splash_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://zkrjbqcgitzdixyfzppp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InprcmpicWNnaXR6ZGl4eWZ6cHBwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAwMzYwMDYsImV4cCI6MjA2NTYxMjAwNn0.V_GBfL8DqyojveNHRuxCjHDeQvKLfaTgNw4XMjem5Z0',
  );
  serviceLocatorSetup();
  Bloc.observer = SimpleBlocObserver();
  runApp(DevicePreview(builder: (context) => MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
