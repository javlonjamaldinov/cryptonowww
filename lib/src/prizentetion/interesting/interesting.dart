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

class Interesting extends StatefulWidget {
  const Interesting({super.key});

  @override
  _InterestingState createState() => _InterestingState();
}

class _InterestingState extends State<Interesting> {
  final List<String> facts = [
    'Bitcoin\nmining\nconsumes\nsignificant\nenergy,\nmore than\nsome\ncountries.',
    'Bitcoin uses\na proof-of-\nwork (PoW)\nconsensus\nmechanism.',
    'Over\n20%\nof\nall\nBitcoin\nis\nlost\nforever,\ndue\nto\nforgotten\nkeys.',
  ];

  int currentFactIndex = 0;
  int remainingFacts = 3;
  bool isDisabled = false;

  void _onSyncPressed() {
    if (isDisabled) return;

    setState(() {
      if (remainingFacts > 0) {
        currentFactIndex = (currentFactIndex + 1) % facts.length;
        remainingFacts--;
        if (remainingFacts == 0) {
          isDisabled = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff04091D),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff04091D),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
      body: Stack(
        children: [
          Positioned(
            top: 20.sp,
            left: 15.sp,
            child: Text(
              facts[currentFactIndex],
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: CircularClipper(),
              child: Container(
                height: 19.h,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff4674FF),
                child: Center(
                  child: Text(
                    remainingFacts == 0
                        ? 'return tomorrow for facts'
                        : '$remainingFacts facts left today',
                    style: TextStyle(
                      color:
                          remainingFacts == 0 ? Colors.white70 : Colors.white38,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 42.sp,
            left: MediaQuery.of(context).size.width / 2 - 3.5.h,
            child: GestureDetector(
              onTap: _onSyncPressed,
              child: Container(
                height: 7.h,
                width: 7.h,
                decoration: BoxDecoration(
                  color: isDisabled ? Colors.grey : const Color(0xff007AFF),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.sync,
                  color: Colors.white,
                  size: 24.sp,
                ),
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
    path.lineTo(0, 50);
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      50,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
