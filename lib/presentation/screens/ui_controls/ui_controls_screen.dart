import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, train, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakeFast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),

        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By car'),
              subtitle: const Text('viajar por carro'),
              value: Transportation
                  .car, // Ayuda a enlazar el valor seleccionado con el valor actual
              groupValue:
                  selectedTransportation, // Variable que usamos para marcar la opcióon seleccionada
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              },
            ),
            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('viajar por bote'),
              value: Transportation
                  .boat, // Ayuda a enlazar el valor seleccionado con el valor actual
              groupValue:
                  selectedTransportation, // Variable que usamos para marcar la opcióon seleccionada
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.boat;
                });
              },
            ),
            RadioListTile(
              title: const Text('By train'),
              subtitle: const Text('viajar por tren'),
              value: Transportation
                  .train, // Ayuda a enlazar el valor seleccionado con el valor actual
              groupValue:
                  selectedTransportation, // Variable que usamos para marcar la opcióon seleccionada
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.train;
                });
              },
            ),
            RadioListTile(
              title: const Text('By submarine'),
              subtitle: const Text('viajar por submarino'),
              value: Transportation
                  .submarine, // Ayuda a enlazar el valor seleccionado con el valor actual
              groupValue:
                  selectedTransportation, // Variable que usamos para marcar la opcióon seleccionada
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.submarine;
                });
              },
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('¿Incluir desayuno?'),
          value: wantsBreakeFast,
          onChanged: (value) {
            setState(() {
              wantsBreakeFast = !wantsBreakeFast;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('¿Incluir Almuerzo?'),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('¿Incluir Cena?'),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
      ],
    );
  }
}
