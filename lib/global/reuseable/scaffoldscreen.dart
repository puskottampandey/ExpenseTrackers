import 'package:expensetracker/constants/constants.dart';
import 'package:flutter/material.dart';

class ReuseableScaffold extends StatelessWidget {
  final String? text;
  final bool appbar;
  final Widget? child;
  final bool? back;
  final bool? changeColor;
  final Color? color;
  final bool? bottomnavigation;
  final Widget? bottomnavigationWidget;
  final Widget? floatingActionButton;

  const ReuseableScaffold({
    this.text,
    this.appbar = false,
    this.back = true,
    this.changeColor = false,
    this.color,
    this.child,
    this.bottomnavigation = false,
    this.bottomnavigationWidget,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          bottomnavigation! ? FloatingActionButtonLocation.centerDocked : null,
      floatingActionButton: bottomnavigation! ? floatingActionButton : null,
      backgroundColor: changeColor! ? color : kvverylightColor,
      bottomNavigationBar: bottomnavigation! ? bottomnavigationWidget : null,
      appBar: appbar
          ? AppBar(
              automaticallyImplyLeading: back! ? true : false,
              iconTheme: IconThemeData(
                  color: changeColor! ? kvverylightColor : kPrimaryDarkColor),
              centerTitle: true,
              backgroundColor: changeColor! ? color : kvverylightColor,
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
