import 'package:expensetracker/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final Color? statusbar;
  final bool light;

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
    this.statusbar,
    this.light = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: light ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      child: Scaffold(
        floatingActionButtonLocation: bottomnavigation!
            ? FloatingActionButtonLocation.centerDocked
            : null,
        floatingActionButton: bottomnavigation! ? floatingActionButton : null,
        backgroundColor: changeColor! ? color : kvverylightColor,
        bottomNavigationBar: bottomnavigation! ? bottomnavigationWidget : null,
        appBar: appbar
            ? AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(),
                automaticallyImplyLeading: back! ? true : false,
                iconTheme: IconThemeData(
                    color: changeColor! ? kvverylightColor : kPrimaryDarkColor),
                centerTitle: true,
                backgroundColor: changeColor! ? color : kvverylightColor,
                title: Text(
                  text!,
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: title3,
                    color:
                        changeColor! ? kvverylightColor : kseconadaryDarkColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : null,
        body: child,
      ),
    );
  }
}
