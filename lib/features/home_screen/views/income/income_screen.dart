import 'package:expensetracker/constants/constants.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/material.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReuseableScaffold(
      appbar: true,
      text: "Income",
      changeColor: true,
      color: kPrimaryGreenColor,
      child: Text("Hello"),
    );
  }
}
