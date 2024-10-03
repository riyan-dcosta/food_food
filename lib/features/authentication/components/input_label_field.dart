import 'package:flutter/material.dart';

class InputLabelField extends StatelessWidget {
  const InputLabelField(
      {super.key,
      required this.label,
      required this.textController,
      this.onChanged,
      this.isPassword = false});

  final String label;
  final TextEditingController textController;
  final ValueChanged<String>? onChanged;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(label),
        ),
        Flexible(
          flex: 1,
          child: TextField(
            obscureText: isPassword,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            ),
            controller: textController,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
