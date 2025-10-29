import '../model/ej4_3cantidades_zero_model.dart';

class Ej43cantidadesZeroController {
  final List<int> _listaDeCantidades = [];

  String ingresarCantidades(String cantidadText) {
    if (cantidadText.isEmpty) {
      return "El campo esta vacío, por favor ingrese una cantidad";
    }

    final cantidadInteger = int.tryParse(cantidadText);

    if (cantidadInteger == null) {
      return "El valor ingresado no es valido";
    }

    if (cantidadInteger < -1000000 || cantidadInteger > 1000000) {
      return "El valor esta fuera de los limites del programa";
    }

    _listaDeCantidades.add(cantidadInteger);
    return "Cantidad ingresada";
  }

  void limpiarLista() {
    _listaDeCantidades.clear();
  }

  String comprobarCantidadesZero() {
    final cantidadModel = Ej43cantidadeszeroModel(_listaDeCantidades);
    final resultado = cantidadModel.comprobarCantidades();

    return resultado;
  }
}
