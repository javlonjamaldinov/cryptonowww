import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Tabbarcode extends StatelessWidget {
  const Tabbarcode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xff0A1336),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TabBar(
        dividerHeight: 0,
        indicator: BoxDecoration(
          color: const Color(0xff4674FF),
          borderRadius: BorderRadius.circular(30),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white54,
        tabs: [
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svg/svg56.svg'),
                SizedBox(
                  width: 1.5.w,
                ),
                const Text(
                  'Exchanger',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svg/svg55.svg'),
                SizedBox(
                  width: 1.5.w,
                ),
                const Text(
                  'User',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GraphTabSelector extends StatelessWidget {
  const GraphTabSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: const Color(0XFF0A1336),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: const Color(0xff3A6CF8),
          borderRadius: BorderRadius.circular(30),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Tab(child: Text('1h')),
          Tab(child: Text('1d')),
          Tab(child: Text('1w')),
          Tab(child: Text('1m')),
          Tab(child: Text('1y')),
        ],
      ),
    );
  }
}
