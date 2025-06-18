import 'package:auvnet_flutter_assessment/core/chache/chache_helper.dart';
import 'package:auvnet_flutter_assessment/core/constant.dart';
import 'package:auvnet_flutter_assessment/core/observer/simple_bloc_observer.dart';
import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
import 'package:auvnet_flutter_assessment/features/splash_screen/presentation/views/splash_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  
  await Supabase.initialize(
    url: dotenv.get(SupabaseSecrtKeys.urlKey),
    anonKey: dotenv.get(SupabaseSecrtKeys.anonKey),
  );
  serviceLocatorSetup();
  getIt.get<CacheHelper>().cacheInit();
  Bloc.observer = SimpleBlocObserver();
  runApp(DevicePreview(builder: (context) => const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
