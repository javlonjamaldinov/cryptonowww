import 'package:cryptonow/src/components/navbar/navbar.dart';
import 'package:cryptonow/src/prizentetion/ui/UnbordingCode.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Unbording extends StatefulWidget {
  const Unbording({super.key});

  @override
  _UnbordingState createState() => _UnbordingState();
}

class _UnbordingState extends State<Unbording> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff04091D),
      body: Column(
        children: [
          SizedBox(
            height: 85.h,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: contents.length,
              itemBuilder: (_, i) {
                return Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 65,
                      child: Text(
                        contents[i].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 33,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      child: SizedBox(
                        height: 75.h,
                        child: Image.asset(
                          contents[i].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 10.5.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xff0A1336),
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(30),
                            topEnd: Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 11.sp),
                            child: Text(
                              contents[i].discripton,
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff0A1336),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    if (_currentPage < contents.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavbarView(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 9.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: const Color(0xff4674FF),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Center(
                      child: Text(
                        _currentPage == contents.length - 1
                            ? 'Start'
                            : 'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
