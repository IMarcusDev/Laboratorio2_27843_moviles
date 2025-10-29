import 'package:flutter/material.dart';

class ProcessBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const ProcessBtn({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
    );
  }
}
