import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    super.key,
    required this.hint,
    required this.onChanged,
    this.inputFormatters = const [],
    this.keyboardType = TextInputType.none,
  });

  final Function(String) onChanged;
  final String hint;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextField(
            //keyboardType: TextInputType.number,
            //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
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
