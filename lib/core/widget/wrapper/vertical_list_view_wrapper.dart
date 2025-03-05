import 'package:flutter/widgets.dart';

class VerticalListViewWrapper extends StatelessWidget {
  final int itemCount;
  final ScrollController? controller;
  final Widget? Function(BuildContext, int) itemBuilder;

  const VerticalListViewWrapper({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller,
        itemCount: itemCount,
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: itemBuilder);
  }
}
