import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.viewPaddingOf(context).top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 28, 16, 10),
          child: const Text('Main'),
        ),

        ...appMenuItems.sublist(0, 3).map((menuItem) {
          return NavigationDrawerDestination(
            icon: Icon(menuItem.icon),
            label: Text(menuItem.title),
          );
        }),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Text('More options'),
        ),
  
        ...appMenuItems.sublist(4).map((menuItem) {
          return NavigationDrawerDestination(
            icon: Icon(menuItem.icon),
            label: Text(menuItem.title),
          );
        }),
      ],
    );
  }
}
