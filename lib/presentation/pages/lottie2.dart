import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/Animation.json'),
    );
  }
}
