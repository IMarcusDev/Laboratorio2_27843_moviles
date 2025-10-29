import 'package:flutter/material.dart';

class Ej48ResultadoView extends StatelessWidget {
  const Ej48ResultadoView({super.key});

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
