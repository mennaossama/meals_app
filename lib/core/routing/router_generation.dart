import 'package:go_router/go_router.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/features/add_meal/add_meal_screen.dart';
import 'package:meals_app/features/home_screen/data/models/meal_model.dart';
import 'package:meals_app/features/home_screen/home_screen.dart';
import 'package:meals_app/features/meal_details/meal_details.dart';
import 'package:meals_app/features/onBoarding/onBoarding_screen.dart';

class RouterGeneration {
  static GoRouter goRouter =
      GoRouter(initialLocation: AppRoutes.onBoardingScreen, routes: [
    GoRoute(
        path: AppRoutes.onBoardingScreen,
        name: AppRoutes.onBoardingScreen,
        builder: (context, state) => const OnboardingScreen()),
    GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: AppRoutes.addMeal,
        name: AppRoutes.addMeal,
        builder: (context, state) => const AddMealScreen()),
    GoRoute(
        path: AppRoutes.mealDetailsScreen,
        name: AppRoutes.mealDetailsScreen,
        builder: (context, state) {
          MealModel meal = state.extra as MealModel;
          return MealDetails(
            meal: meal,
          );
        }),
  ]);
}
