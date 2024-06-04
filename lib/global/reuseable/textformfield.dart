import 'package:flutter/material.dart';

class KTextFormField extends StatefulWidget {
  TextEditingController? controller;
  KTextFormField({super.key, this.controller});

  @override
  State<KTextFormField> createState() => _KTextFormFieldState();
}

class _KTextFormFieldState extends State<KTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
    );
  }
}
