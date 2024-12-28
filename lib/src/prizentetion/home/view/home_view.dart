import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'homeview_container.dart';
import 'view.dart';

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
          home: HomeView(),
        );
      },
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _output = "\$ 0";
  bool _isSwapped = false;

  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        _output = "\$ 0";
      } else if (value == "<") {
        _output = (_output.length > 3)
            ? _output.substring(0, _output.length - 1)
            : "\$ 0";
      } else {
        _output = (_output == "\$ 0") ? "\$ $value" : _output + value;
      }
    });
  }

  void _swapContainers() {
    setState(() {
      _isSwapped = !_isSwapped;
    });
  }

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
              style: TextStyle(color: Colors.white, fontSize: 20.sp),
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
              child: SvgPicture.asset('assets/svg/svg1.svg'),
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset('assets/svg/svg2.svg'),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              _isSwapped
                  ? const CryptoContainer(
                      amount: "0 bts",
                      imagePath: 'assets/images/im6.png',
                      currencyName: 'Bitcoin (BTC)',
                    )
                  : CurrencyContainer(
                      amount: _output,
                      imagePath: 'assets/images/im5.png',
                      currencyName: 'US Dollar',
                    ),
              SizedBox(height: 2.h),
              _isSwapped
                  ? CurrencyContainer(
                      amount: _output,
                      imagePath: 'assets/images/im5.png',
                      currencyName: 'US Dollar',
                    )
                  : const CryptoContainer(
                      amount: "0 bts",
                      imagePath: 'assets/images/im6.png',
                      currencyName: 'Bitcoin (BTC)',
                    ),
            ],
          ),
          Positioned(
            top: 12.h,
            right: 5.h,
            child: InkWell(
              onTap: _swapContainers,
              child: Container(
                height: 8.h,
                width: 8.h,
                decoration: const BoxDecoration(
                    color: Color(0xff3366FF), shape: BoxShape.circle),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/im15.png',
                      height: 7.h,
                      width: 7.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Calculator(onButtonPressed: _buttonPressed),
    );
  }
}

