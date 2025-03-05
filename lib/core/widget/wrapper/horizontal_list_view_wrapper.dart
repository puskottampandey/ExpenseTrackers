import 'package:flutter/widgets.dart';

class HorizontalListViewWrapper extends StatelessWidget {
  final ScrollController? controller;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  const HorizontalListViewWrapper({
    super.key,
    required this.itemBuilder,
    this.controller,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller,
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: itemBuilder);
  }
}
