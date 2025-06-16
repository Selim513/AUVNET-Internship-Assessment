import 'package:flutter/material.dart';

class OnBoardingHeader extends StatelessWidget {
  const OnBoardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xff8900FE), Color(0xffFFDE59)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.8],
                ),
              ),
            ),
          ),
          Center(child: Image.asset('assets/images/nawel.png')),
        ],
      ),
    );
  }
}
