import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });

}

  const appMenuItems = <MenuItem>[
    MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined,
    ),
    MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card,
    ),
    MenuItem(
      title: 'Progess Indicator',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded,
    ),
    MenuItem(
      title: 'Snackbars y diálogos',
      subTitle: 'Indiracores de pantallas',
      link: '/snackbars',
      icon: Icons.info_outlined,
    ),
    MenuItem(
      title: 'Anomated container',
      subTitle: 'Statetful widget animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank_outlined,
    ),
    MenuItem(
      title: 'UI Controls',
      subTitle: 'Una serie de controles en Flutter',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined,
    ),
    MenuItem(
      title: 'Introducción a la aplicación',
      subTitle: 'Pequeño tutorial introductorio',
      link: '/tutorial',
      icon: Icons.accessibility_rounded,
    ),
  ];