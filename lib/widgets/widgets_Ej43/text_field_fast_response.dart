import 'package:flutter/material.dart';

class TextFieldFasteResponse extends StatelessWidget {
  final String mensaje;
  const TextFieldFasteResponse({super.key, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Text(mensaje, style: TextStyle(fontSize: 14));
  }
}
