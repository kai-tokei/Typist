import 'package:flutter/material.dart';

class SystemFloatingButton extends StatelessWidget {
  const SystemFloatingButton({
    super.key,
    required this.hero,
    required this.onPressed,
    required this.icons,
  });

  final String hero;
  final VoidCallback onPressed;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      heroTag: hero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Icon(icons, size: 30),
    );
  }
}
