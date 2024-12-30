import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../prizentation.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff04091D),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff04091D),
        title: Row(
          children: [
            Text(
              'Favourites',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            SvgPicture.asset('assets/svg/svg3.svg'),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 20.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 5.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff0A1336),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Row(
                    children: [
                      Text(
                        'Amount of favourites',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white54,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Container(
                height: 9.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff0A1336),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/svg56.svg',
                            height: 2.h,
                            width: 2.w,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            'Safely change',
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
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'https://safelychange.com/#/ru/partner=5002&sourc...',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Container(
                height: 9.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff0A1336),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/svg55.svg',
                            height: 2.h,
                            width: 2.w,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            'John Snow',
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
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'https://safelychange.com/#/ru/partner=5002&sourc...',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.sp),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Addfavourite(),
              ),
            );
          },
          child: Container(
            height: 7.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff4674FF),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Text(
                'Add favourite',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
