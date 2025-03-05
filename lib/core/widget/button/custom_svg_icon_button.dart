import 'package:expensetracker/core/widget/svg/common_svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/core/theme/theme_import.dart';

class CustomSvgButton extends StatelessWidget {
  final void Function()? onPressed;

  final Color? color;

  final String svgName;
  final double height;
  final double width;

  final double padding;

  const CustomSvgButton({
    super.key,
    this.onPressed,
    this.color,
    required this.svgName,
    this.height = 15,
    this.width = 15,
    this.padding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: CommonSvgWidget(
              svgName: svgName,
              color: color ?? Theme.of(context).primaryColor,
              height: height,
              width: width,
            ),
          )),
    );
  }
}
