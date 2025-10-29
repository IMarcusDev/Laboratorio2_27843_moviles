// En esta pantalla se espera que se coloquen los resultados que salgan de todos los ejercicios
// para demostrar además que una sola pantalla puede ser útil para diversos enunciados

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
