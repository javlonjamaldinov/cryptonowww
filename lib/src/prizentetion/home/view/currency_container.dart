import 'package:cryptonow/src/prizentetion/prizentation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CurrencyContainer extends StatelessWidget {
  final String amount;
  final String imagePath;
  final String currencyName;

  const CurrencyContainer({
    super.key,
    required this.amount,
    required this.imagePath,
    required this.currencyName,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 15.h,
        width: 93.w,
        decoration: BoxDecoration(
          color: const Color(0xff0A1336),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
                    radius: 15,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    currencyName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                amount,
                style: TextStyle(
                  color: const Color(0xff666666),
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CryptoContainer extends StatelessWidget {
  final String amount;
  final String imagePath;
  final String currencyName;

  const CryptoContainer({
    super.key,
    required this.amount,
    required this.imagePath,
    required this.currencyName,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 15.h,
        width: 93.w,
        decoration: BoxDecoration(
          color: const Color(0xff0A1336),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
                    radius: 15,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    currencyName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChooseCrypto()));
                    },
                    child: Icon(
                      Icons.arrow_drop_down_sharp,
                      color: const Color(0xff4674FF),
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                amount,
                style: TextStyle(
                  color: const Color(0xff666666),
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
