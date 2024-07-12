import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/cupertino.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReuseableScaffold(
      appbar: true,
      text: "hello",
    );
  }
}
