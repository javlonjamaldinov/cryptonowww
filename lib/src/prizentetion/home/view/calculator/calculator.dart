import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Calculator extends StatelessWidget {
  final void Function(String) onButtonPressed;
  const Calculator({super.key, required this.onButtonPressed});

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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 35.sp,
        mainAxisSpacing: 18.sp,
      ),
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemCount: buttonValues.length,
      itemBuilder: (context, index) {
        final buttonValue = buttonValues[index];
        return buttonValue == '<'
            ? IconButton(
                onPressed: () => onButtonPressed(buttonValue),
                icon: Image.asset(
                  'assets/images/im14.png',
                  height: 20.sp,
                  width: 20.sp,
                ),
              )
            : TextButton(
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
