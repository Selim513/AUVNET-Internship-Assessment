import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
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
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  right: -30,
                  bottom: -40,
                  child: Container(
                    width: 216,
                    height: 216,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff0EBE7E).withAlpha(50),
                          spreadRadius: 10,
                          blurRadius: 40,
                        ),
                      ],
                   
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff677294),
                        ),
                      ),
                      Gap(60),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xff8900FE),
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(15),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Gap(14),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'next',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff677294),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
