import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widget.dart';
import 'package:meals_app/features/home_screen/data/db_helper/db_helper.dart';
import 'package:meals_app/features/home_screen/data/models/meal_model.dart';
import 'package:meals_app/features/home_screen/widgets/custom_meal_item.dart';
import 'package:meals_app/features/home_screen/widgets/custom_top_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseHelper databaseHelper = DatabaseHelper.instance;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTopHome(),
            HeightSpace(20.h),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your food",
                      style: TextStyles.black16Medium,
                    ),
                    HeightSpace(8.h),
                    Expanded(
                      child: FutureBuilder(
                          future: databaseHelper.getMeals(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Icon(Icons.error,
                                    color: Colors.red, size: 30.sp),
                              );
                            } else if (snapshot.hasData) {
                              return GridView.builder(
                                  itemCount: snapshot.data!.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 22.sp,
                                          crossAxisSpacing: 16.sp,
                                          childAspectRatio: 0.9),
                                  itemBuilder: (context, index) {
                                    MealModel meal = snapshot.data![index];
                                    return CustomMealItem(
                                      imageUrl: meal.imageUrl,
                                      name: meal.name,
                                      rate: meal.rate,
                                      time: meal.time,
                                      onTap: () {
                                        GoRouter.of(context).pushNamed(
                                          AppRoutes.mealDetailsScreen,
                                          extra: meal,
                                        );
                                      },
                                    );
                                  });
                            } else {
                              return Container();
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.sp,
          ),
          onPressed: () {
            GoRouter.of(context).pushNamed(AppRoutes.addMeal);
          },
        ),
      ),
    );
  }
}
