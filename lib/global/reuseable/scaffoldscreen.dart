import 'package:expensetracker/constants.dart';
import 'package:flutter/material.dart';

class ReuseableScaffold extends StatelessWidget {
  final String? text;
  final bool appbar;
  final Widget? child;
  final bool? back;
  final bool? changeColor;
  final Color? color;
  const ReuseableScaffold({
    this.text,
    this.appbar = false,
    this.back = true,
    this.changeColor = false,
    this.color,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: changeColor! ? color : kvverylightColor,
      appBar: appbar
          ? AppBar(
              automaticallyImplyLeading: back! ? true : false,
              iconTheme: IconThemeData(
                  color: changeColor! ? kvverylightColor : kPrimaryDarkColor),
              centerTitle: true,
              backgroundColor:
                  changeColor! ? kPrimaryVoiletColor : kvverylightColor,
              title: Text(
                text!,
                style: textTheme.bodyLarge!.copyWith(
                  fontSize: title3,
                  color: changeColor! ? kvverylightColor : kseconadaryDarkColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : null,
      body: child,
    );
  }
}
