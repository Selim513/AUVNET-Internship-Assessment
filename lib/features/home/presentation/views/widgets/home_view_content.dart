import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/services_section_body.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/shortcuts_section.dart';
import 'package:flutter/material.dart';

class HomeViewContent extends StatelessWidget {
  const HomeViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [ServicesSectionBody(), ShortcutsSection()],
      ),
    );
  }
}
