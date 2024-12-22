
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomContainer extends StatelessWidget {
  final String tabTitle;
  final String imagePath;
  final String currencyPair;
  final String btcAmount;
  final String price;
  final String change;
  final String svgPath;
  final String imagePathSecondary;

  const CustomContainer({
    super.key,
    required this.tabTitle,
    required this.imagePath,
    required this.currencyPair,
    required this.btcAmount,
    required this.price,
    required this.change,
    required this.svgPath,
    required this.imagePathSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.sp),
      child: Column(
        children: [
          Container(
            height: 17.h,
            width: 90.w,
            decoration: BoxDecoration(
              color: const Color(0xff0A1336),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.sp, left: 15.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        imagePath,
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        currencyPair,
                        style: const TextStyle(
                          color: Colors.white38,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      Text(
                        btcAmount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white38,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        price,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.5.h),
                  Row(
                    children: [
                      Text(
                        change,
                        style: TextStyle(
                          color: change.startsWith('-')
                              ? const Color(0xffFF1317)
                              : const Color(0xff17FF13),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      SvgPicture.asset(svgPath),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Image.asset(imagePathSecondary),
          SizedBox(height: 2.h),
          Row(
            children: [
              SvgPicture.asset('assets/svg/svg53.svg'),
              SizedBox(width: 3.w),
              const Text(
                'Last updated: 23 nov 2024 11:52',
                style: TextStyle(
                  color: Colors.white38,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
