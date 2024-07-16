import 'package:expensetracker/constants.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReuseableScaffold(
      appbar: true,
      text: "Expense",
      changeColor: true,
      color: kPrimaryRedColor,
      child: Text("Hello"),
    );
  }
}
