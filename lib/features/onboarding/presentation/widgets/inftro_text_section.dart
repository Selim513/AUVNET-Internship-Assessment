
import 'package:flutter/material.dart';

class IntroTextSection extends StatelessWidget {
  const IntroTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
    
    Text(
      'all-in-one delivery',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 28,
        color: Color(0xff333333),
      ),
    ),
    Text(
      'Order groceries, medicines, and meals \n delivered straight to your door',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14, color: Color(0xff677294)),
    ),
    ],);
  }
}
