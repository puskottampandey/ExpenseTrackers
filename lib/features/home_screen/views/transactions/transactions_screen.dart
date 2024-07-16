import 'package:expensetracker/constants.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReuseableScaffold(
      appbar: true,
      text: "Transactions",
      changeColor: true,
      color: kPrimaryBlueColor,
      child: Text("Hello"),
    );
  }
}
