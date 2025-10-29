class Ej43cantidadeszeroModel {
  List<int> cantidades = [];

  Ej43cantidadeszeroModel(this.cantidades);

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

    String listaMenores =
        "Lista de valores menores a cero: ${menorZero.join(",")}";

    return "Cantidad de ceros: $zero \n Cantidad mayor a cero: ${mayorZero.length} \n $listaMayores \n Cantidad menor a cero: ${menorZero.length} \n $listaMenores";
  }
}
