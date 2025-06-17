import 'package:flutter/material.dart';

class CustomCardContainer extends StatelessWidget {
  const CustomCardContainer({
    super.key,
    required this.image,
    required this.color,
  });

  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(image),
    );
  }
}
