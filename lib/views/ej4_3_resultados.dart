import 'package:flutter/material.dart';

class ResultadoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final resultado = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text("Resultado")),
      body: Center(
        child: Text(
          resultado,
          style: const TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
