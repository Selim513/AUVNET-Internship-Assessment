import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/home_view_header.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [HomeViewHeader()]);
  }
}
