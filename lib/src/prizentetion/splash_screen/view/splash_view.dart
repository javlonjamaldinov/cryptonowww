import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:cryptonow/src/prizentetion/splash_screen/view/unbording.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          "assets/images/im7.png",
          fit: BoxFit.cover,
        ),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: const Unbording(),
    );
  }
}
