import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:yu_health/core/app_routes.dart';
import 'package:yu_health/core/navigation.dart';

import '../../core/constants/asset_constants.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    FlutterNativeSplash.remove();
    runAnimationImage();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void runAnimationImage() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))
      ..addListener(() => setState(() {}));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeOut)..addListener(() => setState(() {}));
    animationController.forward().then((value) => checkUserDetailsLocal());
  }

  Future<void> checkUserDetailsLocal() async {
    bool isHome = '' == '';
    if (isHome) {
      Navigation.intentAndRemove(AppRoutes.kLoginRoute);
    } else {
      Navigation.intentAndRemove(AppRoutes.kHomeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AssetConstants.yuHealthLogoBase,
              fit: BoxFit.fill,
              width: animation.value * 150,
              height: animation.value * 200,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: LinearProgressIndicator(
                value: animationController.value,
                backgroundColor: Colors.blueGrey,
                color: Colors.pinkAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
