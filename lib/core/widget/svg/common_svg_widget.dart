import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonSvgWidget extends StatelessWidget {
  final String svgName;
  final double height;
  final double width;
  final Color? color;
  final double padding;
  const CommonSvgWidget({
    super.key,
    required this.svgName,
    this.height = 16,
    this.width = 16,
    this.color,
    this.padding = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SvgPicture.asset(
        svgName,
        height: height,
        width: width,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      ),
    );
  }
}
