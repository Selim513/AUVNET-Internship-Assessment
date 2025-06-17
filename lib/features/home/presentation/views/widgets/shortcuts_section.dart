import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/shortcut_card.dart';
import 'package:flutter/material.dart';

class ShortcutsSection extends StatelessWidget {
  const ShortcutsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shortcuts:',
          style: AppFontStyle.blackDmSansBold12.copyWith(fontSize: 20),
        ),
        ShortcutCard(),
      ],
    );
  }
}
