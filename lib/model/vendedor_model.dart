final double IVA = 0.15;

class VendedorModel {
  final double venta1;
  final double venta2;
  final double venta3;

  VendedorModel(this.venta1, this.venta2, this.venta3);

  double calcularSueldo() {
    double totalVentas = venta1 + venta2 + venta3;

    // Sumar IVA
    totalVentas *= (1 + IVA);

    // Descuento
    double descuento = 0.20;
    totalVentas *= totalVentas > 2000 ? (1 - descuento) : 1;  // Si es mayor de 2000, aplicar descuento de 20%

    double sueldoBase = 36500;
    double comision = totalVentas * 0.12;
    return sueldoBase + comision;
  }
}
