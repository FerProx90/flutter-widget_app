import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).clearSnackBars(); // Sirve para ocultar snackbars visibles actualmente
    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(
        label: 'OK!',
        onPressed: () {},
      ), // cualquier accion hace que se cierre
      duration: const Duration(seconds: 2), // Tiempo para que se oculte
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackbar,
    ); // trata de encontrar el scaffold mas cercano y ahi construlle el scaffold
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Desactiva que se cierre el dialogo con clicks fuera del diálogo
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
          'Esto es mucho mad texto que es6tot poniendo para rellenar y ver como se termina viendo',
        ),
        actions: [
          TextButton(onPressed: () =>context.pop(), child: const Text('Cancelar')), // funciona con context.pop gracias a GoRouter
          FilledButton(onPressed: () {}, child: const Text('Aceptar')),
        ],
      ), // Builder siempre se construye en tiempo de ejecución
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snackbar screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              // Boton con color de variante tonal
              onPressed: () {
                showAboutDialog(
                  // mostrar diálogo con las licencias de Flutter y pubspect
                  context: context,
                  children: [
                    const Text('Eto es un poco de text, loremipsum50'),
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
