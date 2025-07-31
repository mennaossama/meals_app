import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/app_assets/app_assets.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widget.dart';
import 'package:meals_app/features/onBoarding/onboarding_service/onboarding_service.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> titles = [
    "Save Your Meals Ingredient",
    "Use Our App The Best Choice",
    " Our App Your Ultimate Choice"
  ];
  List<String> descriptions = [
    "Add Your Meals and its Ingredients and we will save it for you",
    "the best choice for your kitchen do not hesitate",
    " All the best restaurants and their top menus are ready for you"
  ];
  int currentIndex = 0;
  CarouselSliderController carouselSliderController =
      CarouselSliderController();
  bool isFirstTime = OnboardingService.isFirstTime();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (isFirstTime) {
        await OnboardingService.setFirstTimeWithFalse();
      } else {
        GoRouter.of(context).pushReplacementNamed(AppRoutes.homeScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(AppAssets.onBoardingImage),
              fit: BoxFit.cover,
            )),
          ),
          Positioned(
            bottom: 18.h,
            left: 32.w,
            right: 32.w,
            child: Container(
              padding: EdgeInsets.all(21.sp),
              width: 311.w,
              height: 400.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(48)),
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: carouselSliderController,
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      height: 230.0.h,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                    ),
                    items: titles.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Column(
                            children: [
                              Text(i,
                                  textAlign: TextAlign.center,
                                  style: TextStyles.onBoardingTitleStyle),
                              HeightSpace(16.h),
                              Text(
                                textAlign: TextAlign.center,
                                descriptions[titles.indexOf(i)],
                                style: TextStyles.onBoardingDescriptionStyle,
                              ),
                            ],
                          );
                        },
                      );
                    }).toList(),
                  ),
                  DotsIndicator(
                    onTap: (index) {
                      carouselSliderController.animateToPage(index);
                      currentIndex = index;
                      setState(() {});
                    },
                    dotsCount: titles.length,
                    position: currentIndex,
                    decorator: DotsDecorator(
                      size: const Size(24.0, 6.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      color: const Color(0xffC2C2C2),
                      spacing: const EdgeInsets.symmetric(horizontal: 2.0),
                      activeSize: const Size(24.0, 6.0),
                      activeColor: AppColors.white,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  const Spacer(),
                  currentIndex >= 2
                      ? InkWell(
                          onTap: () {
                            GoRouter.of(context)
                                .pushReplacementNamed(AppRoutes.homeScreen);
                          },
                          child: Container(
                            width: 62.sp,
                            height: 62.sp,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_forward,
                              color: AppColors.primaryColor,
                              size: 30.sp,
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                GoRouter.of(context)
                                    .pushReplacementNamed(AppRoutes.homeScreen);
                              },
                              child: Text(
                                "Skip",
                                style: TextStyles.white14SemiBold,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (currentIndex < 2) {
                                  currentIndex++;
                                  carouselSliderController
                                      .animateToPage(currentIndex);
                                  setState(() {});
                                }
                              },
                              child: Text(
                                "Next",
                                style: TextStyles.white14SemiBold,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
