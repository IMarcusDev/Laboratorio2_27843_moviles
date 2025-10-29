import 'package:flutter/material.dart';

class TextFieldFasteResponse extends StatelessWidget {
  final String mensaje;
  const TextFieldFasteResponse({super.key, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    // No mostrar nada si el mensaje está vacío
    if (mensaje.isEmpty) {
      return const SizedBox.shrink();
    }

    // Determinar el color basado en el contenido del mensaje
    final bool isSuccess = mensaje.toLowerCase().contains("exito");
    final Color backgroundColor = isSuccess
        ? Colors.green.shade100
        : Theme.of(context).colorScheme.errorContainer;
    final Color textColor = isSuccess
        ? Colors.green.shade900
        : Theme.of(context).colorScheme.onErrorContainer;
    final IconData iconData = isSuccess ? Icons.check_circle : Icons.error;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(iconData, color: textColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              mensaje,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
