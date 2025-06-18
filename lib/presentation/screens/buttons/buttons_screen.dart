import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Button Screen")),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap( // Funciona como un flex row
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Elevated button")),
            const ElevatedButton(onPressed: null, child: Text("Elevated disabled")),
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.access_alarm_outlined) , label: const Text("Elevated button")),

            FilledButton(onPressed: (){}, child: const Text("Filled")),
            FilledButton.icon(onPressed: (){}, icon: const Icon( Icons.accessibility_new), label: const Text("Filled Icon")),

            OutlinedButton(onPressed: (){}, child: const Text("Outline")),
            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.terminal), label: const Text("outline icon")),

            TextButton(onPressed: (){}, child: const Text("Text button")),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.account_box_outlined) , label: const Text("Text icon")),

            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_rounded)),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: const WidgetStatePropertyAll(Colors.white),
              )
            ),

            const CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect( //sirve para añadir bordes redondeados
      borderRadius: BorderRadius.circular(20),
      child: Material( //Nos da los estilos de colores
        color: colors.primary,
        child: InkWell( // Dará el efecto del click
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Botoncito", style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}