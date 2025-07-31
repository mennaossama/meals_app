import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widget.dart';
import 'package:meals_app/features/home_screen/data/models/meal_model.dart';

class MealDetails extends StatelessWidget {
  final MealModel meal;
  const MealDetails({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    //MealModel meal = GoRouter.of(context).state.extra as MealModel;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: CachedNetworkImage(
                        imageUrl: meal.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 327.h,
                      ),
                    ),
                    Positioned(
                      left: 12.w,
                      top: 12.h,
                      child: InkWell(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.transparent,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.white,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const HeightSpace(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(meal.name,
                        style: TextStyles.grey14Regular
                            .copyWith(color: Colors.black, fontSize: 24.sp)),
                    const HeightSpace(21),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.04),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.lock_clock,
                                color: AppColors.primaryColor,
                                size: 16.sp,
                              ),
                              const WidthSpace(4),
                              Text(
                                meal.time.toString(),
                                style: TextStyles.grey14Regular
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.primaryColor,
                                size: 16.sp,
                              ),
                              const WidthSpace(4),
                              Text(
                                meal.rate.toString(),
                                style: TextStyles.grey14Regular
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const HeightSpace(27),
                    const Divider(
                      thickness: 2,
                    ),
                    const HeightSpace(24),
                    Text(
                      "Description",
                      style: TextStyles.black16Medium,
                    ),
                    const HeightSpace(8),
                    Text(
                      meal.description,
                      style: TextStyles.grey14Regular,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
