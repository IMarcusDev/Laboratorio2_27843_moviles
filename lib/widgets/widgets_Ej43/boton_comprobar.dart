import 'package:flutter/material.dart';

class BotonComprobar extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const BotonComprobar({required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(label));
  }
}
