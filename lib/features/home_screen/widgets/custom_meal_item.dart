import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widget.dart';

class CustomMealItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double rate;
  final String time;
  final void Function()? onTap;
  const CustomMealItem(
      {required this.imageUrl,
      required this.name,
      required this.rate,
      required this.time,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.r),
        width: 153.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
              width: 137.w,
              height: 106.h,
              fit: BoxFit.cover,
            ),
            const HeightSpace(8),
            SizedBox(
              width: 120.w,
              child: Text(
                name,
                maxLines: 1,
                style: TextStyles.black16Medium,
              ),
            ),
            const HeightSpace(8),
            SizedBox(
              width: 137.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16.sp,
                        color: AppColors.primaryColor,
                      ),
                      WidthSpace(4.w),
                      Text(
                        rate.toString(),
                        style: TextStyles.grey14Regular
                            .copyWith(color: AppColors.blackColor),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.lock_clock,
                        size: 16.sp,
                        color: AppColors.primaryColor,
                      ),
                      WidthSpace(4.w),
                      Text(
                        time,
                        style: TextStyles.grey14Regular
                            .copyWith(color: AppColors.blackColor),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
