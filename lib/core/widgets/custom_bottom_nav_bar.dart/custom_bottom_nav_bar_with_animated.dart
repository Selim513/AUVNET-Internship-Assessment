import 'package:auvnet_flutter_assessment/core/widgets/custom_bottom_nav_bar.dart/nav_bar_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Custom Bottom Navigation Bar Widget with animated top indicator
class CustomBottomNavbarWithAnimated extends StatefulWidget {
  /// List of navigation items
  final List<NavBarItemModel> items;

  /// Currently selected index
  final int selectedIndex;

  /// Callback when item is selected
  final Function(int) onItemSelected;

  /// Background color of the navigation bar
  final Color backgroundColor;

  /// Color for selected items
  final Color selectedItemColor;

  /// Color for unselected items
  final Color unselectedItemColor;

  /// Color of the top indicator line
  final Color indicatorColor;

  /// Height of the navigation bar
  final double height;

  /// Height of the top indicator line
  final double indicatorHeight;

  /// Width of the top indicator line
  final double indicatorWidth;

  /// Size of the SVG icons
  final double iconSize;

  const CustomBottomNavbarWithAnimated({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
    this.backgroundColor = Colors.white,
    this.selectedItemColor = Colors.blue,
    this.unselectedItemColor = Colors.grey,
    this.indicatorColor = Colors.blue,
    this.height = 70.0,
    this.indicatorHeight = 3.0,
    this.indicatorWidth = 40.0,
    this.iconSize = 24.0,
  });

  @override
  State<CustomBottomNavbarWithAnimated> createState() =>
      _CustomBottomNavbarWithAnimatedState();
}

class _CustomBottomNavbarWithAnimatedState
    extends State<CustomBottomNavbarWithAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation =
        Tween<double>(
          begin: widget.selectedIndex.toDouble(),
          end: widget.selectedIndex.toDouble(),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  void didUpdateWidget(CustomBottomNavbarWithAnimated oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _updateAnimation(oldWidget.selectedIndex, widget.selectedIndex);
    }
  }

  void _updateAnimation(int from, int to) {
    _animation = Tween<double>(begin: from.toDouble(), end: to.toDouble())
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Stack(children: [_buildTopIndicator(), _buildNavigationItems()]),
    );
  }

  Widget _buildTopIndicator() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
          top: 0,
          left: _calculateIndicatorPosition(),
          child: Container(
            width: widget.indicatorWidth,
            height: widget.indicatorHeight,
            decoration: BoxDecoration(
              color: widget.indicatorColor,
              borderRadius: BorderRadius.circular(widget.indicatorHeight / 2),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavigationItems() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.items.length, _buildNavItem),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final item = widget.items[index];
    final isSelected = index == widget.selectedIndex;

    return Expanded(
      child: GestureDetector(
        onTap: () => widget.onItemSelected(index),
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIcon(item, isSelected),
              const SizedBox(height: 4),
              if (item.title != null) _buildTitle(item.title!, isSelected),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(NavBarItemModel item, bool isSelected) {
    final iconPath = isSelected && item.activeIconAsset != null
        ? item.activeIconAsset!
        : item.iconAsset;

    return SvgPicture.asset(
      iconPath,
      width: widget.iconSize,
      height: widget.iconSize,

      colorFilter: ColorFilter.mode(
        isSelected ? widget.selectedItemColor : widget.unselectedItemColor,
        BlendMode.srcIn,
      ),
    );
  }

  Widget _buildTitle(String title, bool isSelected) {
    return Text(
      title,
      style: TextStyle(
        color: isSelected
            ? widget.selectedItemColor
            : widget.unselectedItemColor,
        fontSize: 12,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      textAlign: TextAlign.center,
    );
  }

  double _calculateIndicatorPosition() {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / widget.items.length;
    final currentPosition = _animation.value * itemWidth;
    final centerOffset = (itemWidth - widget.indicatorWidth) / 2;
    return currentPosition + centerOffset;
  }
}
