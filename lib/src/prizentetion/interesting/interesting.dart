import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MaterialApp(
          title: 'Flutter Demo',
          home: Interesting(),
        );
      },
    );
  }
}

class Interesting extends StatelessWidget {
  const Interesting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff04091D),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff04091D),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              (context),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Interesting',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Text(
              'Bitcoin\nmining\nconsumes\nsignificant\nenergy,\nmore than\nsome\ncountries.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 7.h,
            width: 15.w,
            decoration: BoxDecoration(
              color: const Color(0xff4674FF),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          ClipPath(
            clipper: CircularClipper(),
            child: Container(
              height: 17.h,
              width: double.infinity,
              color: const Color(0xff4674FF),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 40); // Левый верхний край с отступом вниз
    path.quadraticBezierTo(
      size.width / 2, // Центр ширины
      0, // Верхняя центральная точка
      size.width, // Правый верхний край
      40,
    );
    path.lineTo(size.width, size.height); // Правый нижний край
    path.lineTo(0, size.height); // Левый нижний край
    path.close(); // Замкнуть путь
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
