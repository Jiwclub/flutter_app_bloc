import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({super.key});

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    startTimer();
    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startTimer() {
    // var duration = const Duration(seconds: 4);
    Timer(
      const Duration(seconds: 2),
      () => context.pushReplacementNamed(Routes.homeScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/app-background.json',
          // controller: _controller,
          animate: true,
        ),
      ),
    );
  }
}
