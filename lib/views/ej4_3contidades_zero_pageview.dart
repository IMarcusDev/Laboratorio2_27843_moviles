import 'package:flutter/material.dart';
import '../controller/ej4_3cantidades_zero_controller.dart';
import '../widgets/widgets_Ej43/input_field.dart';
import '../widgets/widgets_Ej43/boton_comprobar.dart';
import '../widgets/widgets_Ej43/text_field_fast_response.dart';

class Ej43contidadesZeroPageview extends StatefulWidget {
  const Ej43contidadesZeroPageview({super.key});

  @override
  State<Ej43contidadesZeroPageview> createState() => _PaginaViewState();
}

class _PaginaViewState extends State<Ej43contidadesZeroPageview> {
  final controller = Ej43cantidadesZeroController();
  final numeroCtrl = TextEditingController();
  String mensaje = "";

  void _ingresar() {
    setState(() {
      mensaje = controller.ingresarCantidades(numeroCtrl.text);
      if (mensaje.contains("ingresada")) {
        numeroCtrl.clear();
        FocusScope.of(context).unfocus();
      }
    });
  }

  void _calcular() {
    if (controller.estaVacia) {
      setState(() {
        mensaje = "No hay cantidades en la lista para comprobar.";
      });
      return;
    }

    final resultado = controller.comprobarCantidadesZero();
    controller.limpiarLista();
    setState(() {
      mensaje = "";
    });
    Navigator.pushNamed(context, '/ej4_3/resultado', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador de Números"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFieldFasteResponse(mensaje: mensaje),
              const SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InputField(
                        controller: numeroCtrl,
                        label: "Ingrese el número (Ej. -5, 0, 10)",
                        icon: Icons.numbers,
                        keyboardType: const TextInputType.numberWithOptions(
                          signed: true,
                        ),
                      ),
                      const SizedBox(height: 24),
                      BotonComprobar(
                        onPressed: _ingresar,
                        label: "Ingresar cantidad",
                        isPrimary: false,
                        icon: Icons.add,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BotonComprobar(
                onPressed: _calcular,
                label: "Comprobar Lista",
                isPrimary: true,
                icon: Icons.checklist_rtl_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
