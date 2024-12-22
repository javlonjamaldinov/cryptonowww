import 'package:cryptonow/src/prizentetion/favourites/add_favourite/addfavourite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff04091D),
      appBar: AppBar(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No favourites',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Add new favourite info to fill up this screen',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddFavourite()));
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
            ],
          ),
        ),
      ),
    );
  }
}
