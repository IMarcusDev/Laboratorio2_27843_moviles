import '../model/ej4_2_model.dart';

class Ej42Controller {
  /// Valida las entradas (cantidades) y devuelve un mensaje de error o el mapa
  /// con resultados.
  Map<String, dynamic> procesar(String sS, String sD, String sT, bool conTarjeta) {
    if (sS.isEmpty && sD.isEmpty && sT.isEmpty) {
      return {'error': 'Ingrese al menos una cantidad.'};
    }

    final nS = int.tryParse(sS) ?? 0;
    final nD = int.tryParse(sD) ?? 0;
    final nT = int.tryParse(sT) ?? 0;

    if (nS < 0 || nD < 0 || nT < 0) {
      return {'error': 'No se permiten cantidades negativas.'};
    }

    final modelo = Ej42Model(nS, nD, nT);
    final subtotal = modelo.subtotal();
    final recargo = conTarjeta ? modelo.cuotaTarjeta() : 0.0;
    final total = modelo.total(conTarjeta);

    return {
      'error': null,
      'sencillas': nS,
      'dobles': nD,
      'triples': nT,
      'subtotal': subtotal,
      'recargo': recargo,
      'total': total,
      'conTarjeta': conTarjeta,
    };
  }

  String formatoResultados(Map<String, dynamic> data) {
    if (data['error'] != null) return data['error'];

    final s = data['sencillas'];
    final d = data['dobles'];
    final t = data['triples'];
    final subtotal = (data['subtotal'] as double);
    final recargo = (data['recargo'] as double);
    final total = (data['total'] as double);
    final conTarjeta = data['conTarjeta'] as bool;

  return '''Hamburguesas:
Sencillas: $s x \$${Ej42Model.precioS.toStringAsFixed(2)}
Dobles: $d x \$${Ej42Model.precioD.toStringAsFixed(2)}
Triples: $t x \$${Ej42Model.precioT.toStringAsFixed(2)}

Subtotal: \$${subtotal.toStringAsFixed(2)}
${conTarjeta ? "Recargo tarjeta (5%): \$${recargo.toStringAsFixed(2)}\n" : ""}Total a pagar: \$${total.toStringAsFixed(2)}''';
  }
}
