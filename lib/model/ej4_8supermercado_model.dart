class Ej48supermercadoModel {
  Map<String, dynamic> articulos = {};

  Ej48supermercadoModel(this.articulos);

  String calcularArticulos() {
    Map<String, Map<String, double>> carrito = {};

    articulos.forEach((clave, valor) {
      double precio = valor.toDouble();

      if (precio >= 200) {
        carrito[clave] = {'precio': precio, 'descuento': 0.15};
      } else if (precio > 100 && precio < 200) {
        carrito[clave] = {'precio': precio, 'descuento': 0.12};
      } else if (precio <= 100 && precio > 0) {
        carrito[clave] = {'precio': precio, 'descuento': 0.10};
      }
    });

    List<String> lineasDeResumen = [];

    if (carrito.isEmpty) {
      return "No hay artículos que apliquen para descuento.";
    }

    lineasDeResumen.add("--- RESUMEN DE ARTÍCULOS CON DESCUENTO ---");

    carrito.forEach((nombreArticulo, detalles) {
      double precio = detalles['precio']!;
      double descuento = detalles['descuento']!;

      String precioFormateado = precio.toStringAsFixed(2);
      String descuentoPorcentaje = (descuento * 100).toStringAsFixed(0);
      String precioFinal = (precio * (1 - descuento)).toStringAsFixed(2);

      String linea =
          "Articulo: $nombreArticulo \n"
          "  - Precio: \$$precioFormateado \n"
          "  - Descuento: $descuentoPorcentaje% \n"
          "  - Precio Final: \$$precioFinal";

      lineasDeResumen.add(linea);
    });

    return lineasDeResumen.join('\n\n');
  }
}
