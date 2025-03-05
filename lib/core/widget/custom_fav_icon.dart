import 'package:expensetracker/core/theme/theme_import.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomFavIcon extends StatelessWidget {
  final IconData icon;

  final double? size;
  final VoidCallback? voidCallback;
  final Color? color;
  final double padding = 5;
  const CustomFavIcon({
    super.key,
    required this.icon,
    this.size,
    this.color,
    this.voidCallback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Padding(
        padding: EdgeInsets.all(padding.r),
        child: FaIcon(
          icon,
          size: size,
          color: color,
        ),
      ),
    );
  }
}
