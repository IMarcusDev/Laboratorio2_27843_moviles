import '../model/ej4_8supermercado_model.dart';

class Ej48supermercadoController {
  final Map<String, dynamic> _listaDeArticulos = {};

  String ingresarArticulos(String articuloText, String precioText) {
    if (articuloText.isEmpty || precioText.isEmpty) {
      return "Uno o dos de los campos se encuentra vacío, por favor llene todos los campos";
    }

    final nombreArticulo = articuloText;
    final precioArticulo = double.tryParse(precioText);

    if (precioArticulo == null) {
      return "El valor del precio no es válido";
    }

    if (precioArticulo < -10000000 || precioArticulo > 1000000) {
      return "El precio ingresado es demasiado exorbitante no lo cree?";
    }

    _listaDeArticulos[nombreArticulo] = precioArticulo;

    return "Articulo ingresado con exito";
  }

  bool estaVacio() {
    return _listaDeArticulos.isEmpty;
  }

  void limpiarMapa() {
    _listaDeArticulos.clear();
  }

  String procesarCarrito() {
    final carritoModel = Ej48supermercadoModel(_listaDeArticulos);
    final resultado = carritoModel.calcularArticulos();

    return resultado;
  }
}
