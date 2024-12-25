import 'package:cryptonow/src/prizentetion/home/view/currency_container.dart';
import 'package:cryptonow/src/prizentetion/home/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _output = "\$ 0";

  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        _output = "\$ 0";
      } else if (value == "<") {
        if (_output.length > 3) {
          // Account for "$ " prefix
          _output = _output.substring(0, _output.length - 1);
        } else {
          _output = "\$ 0";
        }
      } else {
        if (_output == "\$ 0") {
          _output = "\$ $value";
        } else {
          _output += value;
        }
      }
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
              child: SvgPicture.asset('assets/svg/svg1.svg'),
            ),
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
              CurrencyContainer(
                amount: _output,
                imagePath: 'assets/images/im5.png',
                currencyName: 'US Dollar',
              ),
              SizedBox(
                height: 2.h,
              ),
              const CryptoContainer(
                amount: "0 bts",
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
      bottomNavigationBar: CalculatorWidget(
        onButtonPressed: _buttonPressed,
      ),
    );
  }
}

class CalculatorWidget extends StatelessWidget {
  final void Function(String) onButtonPressed;

  const CalculatorWidget({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    final buttonValues = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '.',
      '0',
      '<'
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 70,
        mainAxisSpacing: 15,
      ),
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemCount: buttonValues.length,
      itemBuilder: (context, index) {
        final buttonValue = buttonValues[index];

        return TextButton(
          onPressed: () => onButtonPressed(buttonValue),
          child: Text(
            buttonValue,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
        );
      },
    );
  }
}
