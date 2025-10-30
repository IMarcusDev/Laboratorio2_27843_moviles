import 'package:flutter/material.dart';
import 'package:laboratorio2_app/widgets/redirect_page_btn.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Elige un Ejercicio',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width > 600 ? 500 : double.infinity),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RedirectPageBtn(text: 'Ejercicio 1', path: '/ej1'),
                  const SizedBox(height: 14),
                  RedirectPageBtn(text: 'Ejercicio 4.1', path: '/ej4_1'),
                  const SizedBox(height: 14),
                  RedirectPageBtn(text: 'Ejercicio 4.2', path: '/ej4_2'),
                  const SizedBox(height: 14),
                  RedirectPageBtn(text: 'Ejercicio 4.3', path: '/ej4_3'),
                  const SizedBox(height: 14),
                  RedirectPageBtn(text: 'Ejercicio 4.8', path: '/ej4_8'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
