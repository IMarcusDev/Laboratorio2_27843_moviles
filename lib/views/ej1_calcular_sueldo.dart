import 'package:flutter/material.dart';
import '../controller/vendedor_controller.dart';
import '../widgets/input_venta.dart';
import '../widgets/process_btn.dart';

class Ej1CalcularSueldo extends StatefulWidget {
  const Ej1CalcularSueldo({super.key});

  @override
  State<Ej1CalcularSueldo> createState() => _Ej1CalcularSueldoState();
}

class _Ej1CalcularSueldoState extends State<Ej1CalcularSueldo> {
  final controller = VendedorController();
  final venta1Ctrl = TextEditingController();
  final venta2Ctrl = TextEditingController();
  final venta3Ctrl = TextEditingController();

  void _calcularSueldo() {
    final resultado = controller.calcularSueldo(
      venta1Ctrl.text,
      venta2Ctrl.text,
      venta3Ctrl.text,
    );
    Navigator.pushNamed(context, '/ej1/sueldo', arguments: resultado);
  }

  void _verFactura() {
    final resultado = controller.getListaProductos(
      venta1Ctrl.text,
      venta2Ctrl.text,
      venta3Ctrl.text,
    );
    Navigator.pushNamed(context, '/ej1/factura', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo de Sueldo"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
        elevation: 2,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- TARJETA PRINCIPAL ---
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InputVenta(
                      controller: venta1Ctrl,
                      label: "Venta 1",
                    ),
                    const SizedBox(height: 16),
                    InputVenta(
                      controller: venta2Ctrl,
                      label: "Venta 2",
                    ),
                    const SizedBox(height: 16),
                    InputVenta(
                      controller: venta3Ctrl,
                      label: "Venta 3",
                    ),

                    const SizedBox(height: 30),

                    // Botones
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProcessBtn(
                          text: 'Calcular Sueldo',
                          onPressed: _calcularSueldo,
                        ),
                        ProcessBtn(
                        text: 'Ver Factura',
                        onPressed: _verFactura,
                      ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
