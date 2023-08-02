import 'package:flutter/material.dart';

class GradientClass extends StatelessWidget {
  GradientClass(this.color1, this.color2, {super.key});
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
        ),
      ),
    );
  }
}
