import 'package:flutter/material.dart';
import '../controller/ej4_8supermercado_controller.dart';
import '../widgets/widgets_Ej43/input_field.dart';
import '../widgets/widgets_Ej43/boton_comprobar.dart';
import '../widgets/widgets_Ej43/text_field_fast_response.dart';

class Ej48PaginaView extends StatefulWidget {
  const Ej48PaginaView({super.key});

  @override
  State<Ej48PaginaView> createState() => _PaginaViewState();
}

class _PaginaViewState extends State<Ej48PaginaView> {
  final controller = Ej48supermercadoController();
  final nombreCtrl = TextEditingController();
  final precioCtrl = TextEditingController();
  String mensaje = "";

  void _ingresar() {
    setState(() {
      mensaje = controller.ingresarArticulos(nombreCtrl.text, precioCtrl.text);
    });
  }

  void _calcular() {
    final resultado = controller.procesarCarrito();
    controller.limpiarMapa();
    Navigator.pushNamed(context, '/resultado', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contabilizar extremos")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFieldFasteResponse(mensaje: mensaje),
            const SizedBox(height: 10),
            InputField(
              controller: nombreCtrl,
              label: "Ingrese el nombre del producto",
            ),
            const SizedBox(height: 20),
            InputField(
              controller: precioCtrl,
              label: "Ingrese el precio del producto",
            ),
            const SizedBox(height: 20),
            BotonComprobar(onPressed: _ingresar, label: "Ingresar cantidad"),
            const SizedBox(height: 20),
            BotonComprobar(onPressed: _calcular, label: "comprobar"),
          ],
        ),
      ),
    );
  }
}
