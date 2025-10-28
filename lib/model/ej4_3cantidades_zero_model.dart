class Ej43cantidadeszeroModel {
  List<int> cantidades = [];

  Ej43cantidadeszeroModel(int cantidad) {
    cantidades.add(cantidad);
  }

  String comprobarCantidades() {
    List<int> menorZero = [];
    List<int> mayorZero = [];
    int zero = 0;

    for (int cant in cantidades) {
      if (cant > 0) {
        mayorZero.add(cant);
      }

      if (cant < 0) {
        menorZero.add(cant);
      }

      if (cant == 0) {
        zero++;
      }
    }

    String listaMayores =
        "Lista de valores mayores a cero: ${mayorZero.join(",")}";

    return "Cantidad de ceros: $zero \n Cantidad mayor a cero: ${mayorZero.length} \n ";
  }
}
