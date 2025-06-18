import 'package:auvnet_flutter_assessment/core/utils/app_color.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_bottom_nav_bar.dart/custom_bottom_nav_bar_with_animated.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_bottom_nav_bar.dart/nav_bar_item_model.dart';
import 'package:auvnet_flutter_assessment/features/cart/cart.dart';
import 'package:auvnet_flutter_assessment/features/category/catehory.dart';
import 'package:auvnet_flutter_assessment/features/delivery/delivery.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/home_view.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/views/profile.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<NavBarItemModel> _navItems = [
    const NavBarItemModel(iconAsset: 'assets/svg/logo.svg', title: 'Home'),
    const NavBarItemModel(
      iconAsset: 'assets/svg/category.svg',
      title: 'Category',
    ),
    const NavBarItemModel(
      iconAsset: 'assets/svg/delivery.svg',
      title: 'Delivery',
    ),
    const NavBarItemModel(iconAsset: 'assets/svg/cart.svg', title: 'Cart'),
    const NavBarItemModel(
      iconAsset: 'assets/svg/profile.svg',
      title: 'Profile',
    ),
  ];

  final List<Widget> _pages = [
    const HomeView(),
    const Category(),
    const Delivery(),
    const Cart(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavbarWithAnimated(
        indicatorColor: AppColors.primaryColor,
        selectedItemColor: AppColors.primaryColor,
        items: _navItems,
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        unselectedItemColor: AppColors.unselectedBottomNavBarItem,
      ),
    );
  }
}
