import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonTitle,
    this.onPressed,
  });
  final String buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        onPressed: onPressed,
        child: Text(
          buttonTitle,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
