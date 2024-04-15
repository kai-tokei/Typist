import 'package:flutter/material.dart';

class MultilineTextBox extends StatelessWidget {
  const MultilineTextBox({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.initialValue = "",
  });

  final Function(String) onChanged;
  final String hintText;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextFormField(
            onChanged: onChanged,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 4,
            initialValue: initialValue,
            cursorColor: Theme.of(context).colorScheme.secondary,
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              filled: true,
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.surface)),
              border: const OutlineInputBorder(),
            )));
  }
}
