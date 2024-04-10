import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    super.key,
    required this.hint,
    required this.onChanged,
  });

  final Function(String) onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextField(
            onChanged: onChanged,
            cursorColor: Theme.of(context).colorScheme.secondary,
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              filled: true,
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.surface)),
              border: const OutlineInputBorder(),
            )));
  }
}
