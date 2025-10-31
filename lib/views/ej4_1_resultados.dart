import 'package:flutter/material.dart';

class Ej41Resultados extends StatelessWidget {
  const Ej41Resultados({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (args == null || args['error'] != null) {
      final msg = args == null ? 'No hay datos para mostrar.' : args['error'];
      return Scaffold(
        appBar: AppBar(title: const Text('Resultados')),
        body: Center(child: Text(msg ?? 'Error')),
      );
    }

    final double inicial = args['salarioInicial'];
    final double porcentaje = args['porcentaje'];
    final int anios = args['anios'];
    final List<double> lista = List<double>.from(args['lista']);
    final double finalSalario = args['salarioFinal'];

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados - Ej. 4.1')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Salario inicial: \$${inicial.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text('Incremento anual: ${porcentaje.toStringAsFixed(2)}%'),
                Text('Años: $anios'),
                const SizedBox(height: 12),
                const Text('Salario recibido por año:', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                ...List.generate(lista.length, (i) => Text('Año ${i + 1}: \$${lista[i].toStringAsFixed(2)}')),
                const SizedBox(height: 12),
                Text('Salario al cabo de $anios años: \$${finalSalario.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
