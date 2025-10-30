import 'package:flutter/material.dart';
import 'package:laboratorio2_app/views/ej1_calcular_sueldo.dart';
import 'package:laboratorio2_app/views/ej4_3_resultados.dart';
import 'package:laboratorio2_app/views/ej4_8supermercado_pageview.dart';
import 'package:laboratorio2_app/views/menu_view.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        // Añadir rutas de otros ejercicios
        '/': (context) => MenuView(),
        '/ej1': (context) => Ej1CalcularSueldo(),
        '/ej1/sueldo': (context) => ResultadoView(),
        '/ej1/factura': (context) => ResultadoView(),
        '/ej4_1': (context) => Ej1CalcularSueldo(),
        '/ej4_2': (context) => Ej1CalcularSueldo(),
        '/ej4_3': (context) => Ej1CalcularSueldo(),
        '/ej4_8': (context) => Ej48PaginaView(),
      },
    );
  }
}
