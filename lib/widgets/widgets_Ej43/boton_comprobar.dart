import 'package:flutter/material.dart';

class BotonComprobar extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isPrimary;
  final IconData? icon;

  const BotonComprobar({
    super.key,
    required this.onPressed,
    required this.label,
    this.isPrimary = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );

    final buttonLabel = Text(label);

    if (isPrimary) {
      // Botón principal (relleno)
      return icon != null
          ? FilledButton.icon(
              onPressed: onPressed,
              style: style,
              icon: Icon(icon),
              label: buttonLabel,
            )
          : FilledButton(
              onPressed: onPressed,
              style: style,
              child: buttonLabel,
            );
    } else {
      // Botón secundario (elevado o tonal)
      return icon != null
          ? ElevatedButton.icon(
              onPressed: onPressed,
              style: style,
              icon: Icon(icon),
              label: buttonLabel,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: style,
              child: buttonLabel,
            );
    }
  }
}
