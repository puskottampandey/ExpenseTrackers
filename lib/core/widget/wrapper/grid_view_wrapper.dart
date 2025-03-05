import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewWrapper extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  final ScrollController? controller;

  final int itemCount;

  final ScrollPhysics? physics;

  final Widget? Function(BuildContext, int) itemBuilder;
  const GridViewWrapper({
    super.key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 0.9,
    this.controller,
    required this.itemBuilder,
    required this.itemCount,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 13.h,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
