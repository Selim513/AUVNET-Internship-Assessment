import 'package:auvnet_flutter_assessment/core/utils/image_assets.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/models/resturant_model.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/models/services_card_model.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/models/shortcuts_card_model.dart';
import 'package:auvnet_flutter_assessment/features/onboarding/presentation/models/onboarding_texts_model.dart';

abstract class Constant {
  static final List<OnboardingTextsModel> onboardingPages = [
    OnboardingTextsModel(
      title: 'All-in-one Delivery',
      subTitle:
          'Order groceries, medicines, and meals \n delivered straight to your door',
    ),
    OnboardingTextsModel(
      title: 'User-to-User Delivery',
      subTitle: 'Send or receive items from other users quickly and easily',
    ),
    OnboardingTextsModel(
      title: 'Sales & Discounts',
      subTitle: 'Discover exclusive sales and deals every day',
    ),
  ];
  static final List<ServicesCardModel> servicesCardItem = [
    ServicesCardModel(
      title: 'Food',
      tagInfo: 'Up to 50%',
      image: ServicesSectionImages.food,
    ),
    ServicesCardModel(
      title: 'Health & wellness',
      tagInfo: '20mins',
      image: ServicesSectionImages.health,
    ),
    ServicesCardModel(
      title: 'Groceries',
      tagInfo: '20mins',
      image: ServicesSectionImages.geroceries,
    ),
  ];
  static final List<ShortcutsCardModel> shortcutCardItem = [
    ShortcutsCardModel(
      title: 'Past orders',
      image: ShortcutsSectionImages.list,
    ),
    ShortcutsCardModel(
      title: 'Super Saver',
      image: ShortcutsSectionImages.valut,
    ),
    ShortcutsCardModel(title: 'Must-tries', image: ShortcutsSectionImages.n),
    ShortcutsCardModel(
      title: 'Give Back',
      image: ShortcutsSectionImages.support,
    ),
    ShortcutsCardModel(
      title: 'Best Sellers',
      image: ShortcutsSectionImages.star,
    ),
  ];
  static final List<ResturantModel> resturantItem = [
    ResturantModel(
      time: '32 mins',
      title: 'Allo Beirut ',
      image: ResturantImageAsset.allo,
    ),
    ResturantModel(
      time: '38 mins',
      title: 'Laffah',
      image: ResturantImageAsset.laffah,
    ),
    ResturantModel(
      time: '44 mins',
      title: 'Falafil AlRabiah Al kha...',
      image: ResturantImageAsset.flafil,
    ),
    ResturantModel(
      time: '34 mins',
      title: 'Barbar',
      image: ResturantImageAsset.barbar,
    ),
  ];
}

abstract class LocalCachedKeys {
  static String imageKey = 'image';
  static String addressKey = 'Address';
}
