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
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
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
