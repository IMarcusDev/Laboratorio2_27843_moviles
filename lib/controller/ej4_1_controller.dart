import '../model/ej4_1_model.dart';

class Ej41Controller {
  Map<String, dynamic> procesar(
    String sSalario,
    String sPorcentaje,
    String sAnios,
  ) {
    if (sSalario.isEmpty || sPorcentaje.isEmpty || sAnios.isEmpty) {
      return {'error': 'Complete todos los campos.'};
    }

    final salario = double.tryParse(sSalario);
    final porcentaje = double.tryParse(sPorcentaje);
    final anios = int.tryParse(sAnios);

    if (salario == null || porcentaje == null || anios == null) {
      return {'error': 'Ingrese valores numéricos válidos porfas.'};
    }

    if (salario <= 0 || porcentaje < 0 || anios <= 0) {
      return {'error': 'Los valores deben ser positivos porfas.'};
    }

    final modelo = Ej41Model(salario, porcentaje, anios);
    final lista = modelo.salariosPorAnio();
    final finalSalario = modelo.salarioFinal();

    return {
      'error': null,
      'salarioInicial': salario,
      'porcentaje': porcentaje,
      'anios': anios,
      'lista': lista,
      'salarioFinal': finalSalario,
    };
  }

  String formatoResultados(Map<String, dynamic> data) {
    if (data['error'] != null) return data['error'];

    final double inicial = data['salarioInicial'];
    final double porcentaje = data['porcentaje'];
    final int anios = data['anios'];
    final List<double> lista = List<double>.from(data['lista']);

    final buffer = StringBuffer();
    buffer.writeln('Salario inicial: \$${inicial.toStringAsFixed(2)}');
    buffer.writeln('Incremento anual: ${porcentaje.toStringAsFixed(2)}%');
    buffer.writeln('Años: $anios');
    buffer.writeln('---');
    for (var i = 0; i < lista.length; i++) {
      buffer.writeln('Año ${i + 1}: \$${lista[i].toStringAsFixed(2)}');
    }
    buffer.writeln('---');
    buffer.writeln(
      'Salario al cabo de $anios años: \$${data['salarioFinal'].toStringAsFixed(2)}',
    );

    return buffer.toString();
  }
}
