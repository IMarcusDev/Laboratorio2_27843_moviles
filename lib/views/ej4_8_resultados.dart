import 'package:flutter/material.dart';

class Ej48ResultadoView extends StatelessWidget {
  const Ej48ResultadoView({super.key});

  @override
  Widget build(BuildContext context) {
    final resultado = ModalRoute.of(context)!.settings.arguments as String;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resumen de Descuentos"),
        backgroundColor: theme.colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: Text(
                resultado,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontFamily: 'monospace',
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
