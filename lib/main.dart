import 'package:flutter/material.dart';
import 'package:laboratorio2_app/views/ej1_calcular_sueldo.dart';
import 'package:laboratorio2_app/views/ej4_3_resultados.dart';
import 'package:laboratorio2_app/views/ej4_8supermercado_pageview.dart';
import 'package:laboratorio2_app/views/ej4_2_pageview.dart';
import 'package:laboratorio2_app/views/ej4_2_resultados.dart';
import 'package:laboratorio2_app/views/ej4_1_pageview.dart';
import 'package:laboratorio2_app/views/ej4_1_resultados.dart';
import 'package:laboratorio2_app/views/ej4_3contidades_zero_pageview.dart';
import 'package:laboratorio2_app/views/ej4_8_resultados.dart';
import 'package:laboratorio2_app/views/menu_view.dart';
import 'package:laboratorio2_app/views/resultado_view.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MenuView(),
        '/ej1': (context) => Ej1CalcularSueldo(),
        '/ej1/sueldo': (context) => ResultadoView(),
        '/ej1/factura': (context) => ResultadoView(),
        '/ej4_1': (context) => Ej41PaginaView(),
        '/ej4_1/result': (context) => Ej41Resultados(),
        '/ej4_2': (context) => Ej42PaginaView(),
        '/ej4_2/result': (context) => Ej42Resultados(),
        '/ej4_3': (context) => Ej43contidadesZeroPageview(),
        '/ej4_3/resultado': (context) => Ej43ResultadosView(),
        '/ej4_8': (context) => Ej48PaginaView(),
        '/ej4_8/voucher': (context) => Ej48ResultadoView(),
      },
    );
  }
}
