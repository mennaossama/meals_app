import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/routing/router_generation.dart';
import 'package:meals_app/features/onBoarding/onboarding_service/onboarding_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnboardingService.initializeSharedPrefrencesStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: RouterGeneration.goRouter,
          title: 'Meals App',
        );
      },
    );
  }
}
