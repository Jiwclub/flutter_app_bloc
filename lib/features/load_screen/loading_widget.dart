import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Lottie.asset(
          'assets/loading_screen.json',
          // controller: _controller,
          animate: true,
        ),
      ),
    );
  }
}
