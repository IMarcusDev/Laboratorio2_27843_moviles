class Ej42Model {
  final int sencillas;
  final int dobles;
  final int triples;

  static const double precioS = 20.0;
  static const double precioD = 25.0;
  static const double precioT = 28.0;
  static const double recargoTarjeta = 0.05; // 5%

  Ej42Model(this.sencillas, this.dobles, this.triples);

  double subtotal() {
    return sencillas * precioS + dobles * precioD + triples * precioT;
  }

  double cuotaTarjeta() {
    return subtotal() * recargoTarjeta;
  }

  double total(bool conTarjeta) {
    final s = subtotal();
    return conTarjeta ? s + cuotaTarjeta() : s;
  }
}
