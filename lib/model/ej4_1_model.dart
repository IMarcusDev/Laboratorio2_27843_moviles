class Ej41Model {
  final double salarioInicial;
  final double porcentajeIncremento;
  final int anios;

  Ej41Model(this.salarioInicial, this.porcentajeIncremento, this.anios);

  List<double> salariosPorAnio() {
    final List<double> lista = [];
    double salario = salarioInicial;
    final factor = 1 + porcentajeIncremento / 100.0;
    for (var i = 0; i < anios; i++) {
      salario = salario * factor;
      lista.add(salario);
    }
    return lista;
  }

  double salarioFinal() =>
      salariosPorAnio().isNotEmpty ? salariosPorAnio().last : salarioInicial;
}
