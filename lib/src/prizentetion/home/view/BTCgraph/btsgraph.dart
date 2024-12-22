import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../ui/customcontainer/сustom_сontainer.dart';
import '../../../ui/tabbar_code/tabbarcode.dart';

class Btsgraph extends StatelessWidget {
  const Btsgraph({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xff04091D),
        appBar: AppBar(
          backgroundColor: const Color(0xff04091D),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 36.sp),
                child: Text(
                  'BTC graph',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              SvgPicture.asset('assets/svg/svg50.svg'),
            ],
          ),
          toolbarHeight: 90,
        ),
        body: const Column(
          children: [
            GraphTabSelector(),
            Expanded(
              child: TabBarView(
                children: [
                  CustomContainer(
                      tabTitle: '1h',
                      imagePath: 'assets/images/im8.png',
                      currencyPair: 'BTC/USD',
                      btcAmount: '1 BTC',
                      price: '\$99063.20',
                      change: '-\$363.20 (-0.36%)',
                      svgPath: 'assets/svg/svg54.svg',
                      imagePathSecondary: 'assets/images/im11.png'),
                  CustomContainer(
                      tabTitle: '1d',
                      imagePath: 'assets/images/im8.png',
                      currencyPair: 'BTC/EUR',
                      btcAmount: '0.9 BTC',
                      price: '\$99558,516',
                      change: '\$495.11 (0.5%)',
                      svgPath: 'assets/svg/svg52.svg',
                      imagePathSecondary: 'assets/images/im10.png'),
                  CustomContainer(
                      tabTitle: '1w',
                      imagePath: 'assets/images/im8.png',
                      currencyPair: 'BTC/GBP',
                      btcAmount: '0.8 BTC',
                      price: '\$99558,516',
                      change: '\$495.11 (0.5%)',
                      svgPath: 'assets/svg/svg52.svg',
                      imagePathSecondary: 'assets/images/im12.png'),
                  CustomContainer(
                      tabTitle: '1m',
                      imagePath: 'assets/images/im8.png',
                      currencyPair: 'BTC/AUD',
                      btcAmount: '1.1 BTC',
                      price: '\$99558,516',
                      change: '\$495.11 (0.5%)',
                      svgPath: 'assets/svg/svg52.svg',
                      imagePathSecondary: 'assets/images/im12.png'),
                  CustomContainer(
                      tabTitle: '1y',
                      imagePath: 'assets/images/im8.png',
                      currencyPair: 'BTC/JPY',
                      btcAmount: '1.2 BTC',
                      price: '\$99558,516',
                      change: '\$495.11 (0.5%)',
                      svgPath: 'assets/svg/svg52.svg',
                      imagePathSecondary: 'assets/images/im13.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
