import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../models/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final User user = User.dummy();
  late Size size;
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          _crossFadeState = CrossFadeState.showSecond;
        });
      },
    ).then(
      (_) {
        Future.delayed(
          const Duration(seconds: 2),
          () {
            GoRouter.of(context).goNamed(
              "home",
              extra: user,
            );
            log("should move to home");
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size.width * 0.6,
          child: AnimatedCrossFade(
            crossFadeState: _crossFadeState,
            duration: const Duration(seconds: 1),
            firstChild: const Text(
              "Welcome",
            ),
            sizeCurve: Curves.easeInCirc,
            secondChild: Image.network(
              "https://uilogos.co/img/logotype/circle.png",
            ),
          ),
        ),
      ),
    );
  }
}
