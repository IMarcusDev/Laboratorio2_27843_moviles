import 'package:flutter/material.dart';
import '../controller/ej4_2_controller.dart';
import '../widgets/input_venta.dart';
import '../widgets/process_btn.dart';

class Ej42PaginaView extends StatefulWidget {
  const Ej42PaginaView({super.key});

  @override
  State<Ej42PaginaView> createState() => _Ej42PaginaViewState();
}

class _Ej42PaginaViewState extends State<Ej42PaginaView> {
  final controller = Ej42Controller();

  final sencillasCtrl = TextEditingController();
  final doblesCtrl = TextEditingController();
  final triplesCtrl = TextEditingController();
  bool conTarjeta = false;
  String mensaje = '';

  void _calcular() {
    final resultado = controller.procesar(
      sencillasCtrl.text,
      doblesCtrl.text,
      triplesCtrl.text,
      conTarjeta,
    );

    if (resultado['error'] != null) {
      setState(() {
        mensaje = resultado['error'];
      });
      return;
    }

    // Navegar a la vista de resultados pasando el mapa de resultado
    Navigator.pushNamed(context, '/ej4_2/result', arguments: resultado);
    // limpiar campos y mensaje
    setState(() {
      mensaje = '';
      sencillasCtrl.clear();
      doblesCtrl.clear();
      triplesCtrl.clear();
      conTarjeta = false;
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('El náufrago satisfecho'),
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
                  color: Colors.yellow[100],
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
                      InputVenta(controller: sencillasCtrl, label: 'Cantidad - Sencillas (S)'),
                      const SizedBox(height: 12),
                      InputVenta(controller: doblesCtrl, label: 'Cantidad - Dobles (D)'),
                      const SizedBox(height: 12),
                      InputVenta(controller: triplesCtrl, label: 'Cantidad - Triples (T)'),
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Checkbox(
                            value: conTarjeta,
                            onChanged: (v) => setState(() => conTarjeta = v ?? false),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(child: Text('Pago con tarjeta (recargo 5%)')),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ProcessBtn(onPressed: _calcular, text: 'Calcular Total'),
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
