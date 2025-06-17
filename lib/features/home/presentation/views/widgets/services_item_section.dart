import 'package:auvnet_flutter_assessment/core/constant.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/custom_services_card.dart';
import 'package:flutter/widgets.dart';

class ServicesCategory extends StatelessWidget {
  const ServicesCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Constant.servicesCardItem.map((services) {
        return Expanded(
          child: CustomServicesCard(
            image: services.image,
            infoTagTitle: services.tagInfo,
            title: services.title,
          ),
        );
      }).toList(),
    );
  }
}
