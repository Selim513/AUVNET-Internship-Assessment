import 'package:flutter/material.dart';

abstract class AppRouteServices {
  static void push(context, {required Widget page}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static void pushReplaceMent(context, {required Widget page}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
