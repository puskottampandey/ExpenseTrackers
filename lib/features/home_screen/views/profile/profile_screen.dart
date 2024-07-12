import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReuseableScaffold(
      appbar: true,
      text: "hello",
    );
  }
}
