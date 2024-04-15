import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    super.key,
    required this.hint,
    required this.onChanged,
    this.initialValue = "",
    this.inputFormatters = const [],
    this.keyboardType = TextInputType.none,
  });

  final Function(String) onChanged;
  final String hint;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextFormField(
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            cursorColor: Theme.of(context).colorScheme.secondary,
            initialValue: initialValue,
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
