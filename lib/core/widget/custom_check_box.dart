import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/widget/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CustomCheckBox extends StatefulWidget {
  final String label;
  final ValueChanged<bool> onChange;
  final bool? initialValue;

  const CustomCheckBox({
    Key? key,
    required this.label,
    required this.onChange,
    this.initialValue,
  }) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _value = true;

  void changeHandler() {
    setState(() {
      _value = !_value;
    });
    widget.onChange(_value);
  }

  @override
  void initState() {
    if (widget.initialValue != null) {
      _value = widget.initialValue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final _isLightMode = UiUtils.isLightMode(theme);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 18,
          height: 18,
          child: Checkbox(
            checkColor: _isLightMode
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.onSurface,
            side: BorderSide(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            value: _value,
            onChanged: (value) => changeHandler(),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        TextButton(
          onPressed: changeHandler,
          child: Text(widget.label, style: textTheme.bodySmall!),
        ),
      ],
    );
  }
}
