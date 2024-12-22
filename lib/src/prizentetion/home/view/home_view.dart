import 'package:cryptonow/src/prizentetion/prizentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff04091D),
      appBar: AppBar(
        backgroundColor: const Color(0xff04091D),
        title: Row(
          children: [
            Text(
              'Converter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Btsgraph(),
                    ),
                  );
                },
                child: SvgPicture.asset('assets/svg/svg1.svg')),
            SizedBox(
              width: 8.w,
            ),
            SvgPicture.asset('assets/svg/svg2.svg'),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              const CurrencyContainer(
                amount: '\$ 0',
                imagePath: 'assets/images/im5.png',
                currencyName: 'US Dollar',
              ),
              SizedBox(
                height: 2.h,
              ),
              const CryptoContainer(
                amount: '0  bts',
                imagePath: 'assets/images/im6.png',
                currencyName: 'Bitcoin (BTC)',
              ),
            ],
          ),
          Positioned(
            top: 12.h,
            right: 5.h,
            child: Container(
              height: 8.h,
              width: 8.h,
              decoration: const BoxDecoration(
                color: Color(0xff3366FF),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.swap_vert,
                color: Colors.white,
                size: 21.sp,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CalculatorWidget(),
    );
  }
}
