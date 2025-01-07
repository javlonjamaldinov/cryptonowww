import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Addfavorite2 extends StatelessWidget {
  final Map<String, String> favourite;

  const Addfavorite2({required this.favourite, super.key});

  @override
  Widget build(BuildContext context) {
    String iconPath = favourite['type'] == 'User'
        ? 'assets/svg/svg55.svg'
        : 'assets/svg/svg56.svg';

    return Container(
      height: 9.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff0A1336),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: 2.h,
                  width: 2.w,
                ),
                SizedBox(width: 2.w),
                Text(
                  favourite['name'] ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white38,
                  size: 17.sp,
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Text(
              favourite['link'] ?? '',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
