import '../model/vendedor_model.dart';

class VendedorController {
  String calcularSueldo(String s1, String s2, String s3) {
    if (s1.isEmpty || s2.isEmpty || s3.isEmpty) {
      return " Ingrese las tres ventas.";
    }

    final v1 = double.tryParse(s1);
    final v2 = double.tryParse(s2);
    final v3 = double.tryParse(s3);

    if (v1 == null || v2 == null || v3 == null) {
      return " Solo se permiten números.";
    }

    final vendedor = VendedorModel(v1, v2, v3);
    final sueldo = vendedor.calcularSueldo();

    return " Sueldo neto: \$${sueldo.toStringAsFixed(2)}";
  }

  String getListaProductos(String s1, String s2, String s3) {
    final v1 = double.tryParse(s1);
    final v2 = double.tryParse(s2);
    final v3 = double.tryParse(s3);

    if (v1 == null || v2 == null || v3 == null) {
      return " Solo se permiten números.";
    }

    return 'Producto 1: $s1\nProducto 2: $s2\nProducto 3: $s3';
  }

  String getResults(String s1, String s2, String s3) {
    return 'Sueldo: \n${calcularSueldo(s1, s2, s3)}\n\nLista de Productos: \n${getListaProductos(s1, s2, s3)}';
  }
}
