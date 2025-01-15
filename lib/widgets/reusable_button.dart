import 'package:flutter/material.dart';

import '../commons.dart';
import '../utils/constants.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;
  final WidgetStateProperty<EdgeInsets>? padding;

  const DefaultButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isActive = false,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            padding: padding ?? getButtonPadding(context),
            backgroundColor: WidgetStateProperty.all<Color>(
                isActive ? kAppDefaultColor : Colors.grey)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: isActive ? Colors.white : Colors.black45, fontSize: 16),
        ));
  }
}
