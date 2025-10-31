import 'package:flutter/material.dart';

class Ej42Resultados extends StatelessWidget {
  const Ej42Resultados({super.key});

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

    final s = args['sencillas'];
    final d = args['dobles'];
    final t = args['triples'];
    final subtotal = (args['subtotal'] as double);
    final recargo = (args['recargo'] as double);
    final total = (args['total'] as double);
    final conTarjeta = args['conTarjeta'] as bool;

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados - El náufrago satisfecho')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Detalle de compra', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                Text('Sencillas: $s x \$20.00'),
                Text('Dobles: $d x \$25.00'),
                Text('Triples: $t x \$28.00'),
                const SizedBox(height: 12),
                Text('Subtotal: \$${subtotal.toStringAsFixed(2)}'),
                if (conTarjeta) Text('Recargo tarjeta (5%): \$${recargo.toStringAsFixed(2)}'),
                const SizedBox(height: 8),
                Text('Total a pagar: \$${total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
