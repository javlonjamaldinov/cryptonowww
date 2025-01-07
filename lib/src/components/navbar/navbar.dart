import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../prizentetion/home/home.dart';
import '../../prizentetion/prizentation.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  int _currentIndex = 0;
  final List<Widget> views = [
    const HomeView(),
    const Favourites(),
    const Transactions(),
    const SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[_currentIndex],
      backgroundColor: const Color(0xff0A1336),
      bottomNavigationBar: SizedBox(
        height: 12.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xff0A1336),
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xff666666),
            onTap: (value) => setState(() {
              _currentIndex = value;
            }),
            selectedLabelStyle: const TextStyle(
              color: Colors.white,
            ),
            unselectedLabelStyle: const TextStyle(
              color: Colors.white,
            ),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/svg7.svg',
                  color: const Color(0xff666666),
                  width: 3.w,
                  height: 3.h,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/svg/svg7.svg',
                  color: Colors.white,
                  width: 3.w,
                  height: 3.h,
                ),
                label: 'Converter',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/svg8.svg',
                  color: const Color(0xff666666),
                  width: 3.w,
                  height: 3.h,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/svg/svg8.svg',
                  color: Colors.white,
                  width: 3.w,
                  height: 3.h,
                ),
                label: 'Favourites',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/svg9.svg',
                  color: const Color(0xff666666),
                  width: 3.w,
                  height: 3.h,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/svg/svg9.svg',
                  color: Colors.white,
                  width: 3.w,
                  height: 3.h,
                ),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/svg10.svg',
                  color: const Color(0xff666666),
                  width: 3.w,
                  height: 3.h,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/svg/svg10.svg',
                  color: Colors.white,
                  width: 3.w,
                  height: 3.h,
                ),
                label: 'P2P',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
