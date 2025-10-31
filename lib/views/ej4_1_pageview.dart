import 'package:flutter/material.dart';
import '../controller/ej4_1_controller.dart';
import '../widgets/input_venta.dart';
import '../widgets/process_btn.dart';

class Ej41PaginaView extends StatefulWidget {
  const Ej41PaginaView({super.key});

  @override
  State<Ej41PaginaView> createState() => _Ej41PaginaViewState();
}

class _Ej41PaginaViewState extends State<Ej41PaginaView> {
  final controller = Ej41Controller();

  final salarioCtrl = TextEditingController(text: '1500');
  final porcentajeCtrl = TextEditingController(text: '10');
  final aniosCtrl = TextEditingController(text: '6');

  String mensaje = '';

  void _calcular() {
    final resultado = controller.procesar(salarioCtrl.text, porcentajeCtrl.text, aniosCtrl.text);
    if (resultado['error'] != null) {
      setState(() => mensaje = resultado['error']);
      return;
    }

    Navigator.pushNamed(context, '/ej4_1/result', arguments: resultado);
    setState(() {
      mensaje = '';
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incremento Salarial - Ej. 4.1'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (mensaje.isNotEmpty)
                Card(
                  color: Colors.red[50],
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(mensaje, style: const TextStyle(color: Colors.black87)),
                  ),
                ),
              const SizedBox(height: 12),

              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InputVenta(controller: salarioCtrl, label: 'Salario inicial (\$)'),
                      const SizedBox(height: 12),
                      InputVenta(controller: porcentajeCtrl, label: 'Incremento anual (%)'),
                      const SizedBox(height: 12),
                      InputVenta(controller: aniosCtrl, label: 'Años'),
                      const SizedBox(height: 16),
                      ProcessBtn(onPressed: _calcular, text: 'Calcular Salarios'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
