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
      // Limpiar campos si el ingreso fue exitoso
      if (mensaje.contains("exito")) {
        nombreCtrl.clear();
        precioCtrl.clear();
        // Quitar foco para esconder el teclado
        FocusScope.of(context).unfocus();
      }
    });
  }

  void _calcular() {
    if (controller.estaVacio()) {
      setState(() {
        mensaje = "No hay artículos en el carrito para procesar.";
      });
      return;
    }

    final resultado = controller.procesarCarrito();
    controller.limpiarMapa();
    setState(() {
      mensaje = ""; // Limpiar mensaje al salir
    });
    Navigator.pushNamed(context, '/ej4_8/vaucher', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrito de Supermercado"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // --- ÁTOMO DE RESPUESTA RÁPIDA ---
              TextFieldFasteResponse(mensaje: mensaje),
              const SizedBox(height: 16),

              // --- MOLÉCULA DE FORMULARIO ---
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
                      // --- ÁTOMO DE ENTRADA (NOMBRE) ---
                      InputField(
                        controller: nombreCtrl,
                        label: "Nombre del producto",
                        icon: Icons.shopping_bag_outlined,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),

                      // --- ÁTOMO DE ENTRADA (PRECIO) ---
                      InputField(
                        controller: precioCtrl,
                        label: "Precio del producto",
                        icon: Icons.attach_money,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // --- ÁTOMO DE BOTÓN (INGRESAR) ---
                      BotonComprobar(
                        onPressed: _ingresar,
                        label: "Ingresar Artículo",
                        isPrimary: false, // Estilo secundario
                        icon: Icons.add_shopping_cart,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- ÁTOMO DE BOTÓN (CALCULAR) ---
              BotonComprobar(
                onPressed: _calcular,
                label: "Calcular Descuentos",
                isPrimary: true, // Estilo primario
                icon: Icons.calculate_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
