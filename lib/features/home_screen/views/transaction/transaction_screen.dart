import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/cupertino.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReuseableScaffold(
      appbar: true,
      text: "hello",
    );
  }
}
