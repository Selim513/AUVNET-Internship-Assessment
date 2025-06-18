/// Model class for navigation bar items
class NavBarItemModel {
  /// Path to the SVG icon asset
  final String iconAsset;

  /// Optional path to the active state SVG icon asset
  final String? activeIconAsset;

  /// Title text displayed below the icon
  final String? title;

  const NavBarItemModel({
    required this.iconAsset,
    this.activeIconAsset,
    this.title,
  });
}
