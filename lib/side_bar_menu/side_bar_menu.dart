import 'package:animated_side_bar_and_navigation_bar/list.dart';
import 'package:animated_side_bar_and_navigation_bar/side_bar_menu/side_menu_components/side_bar_manu_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../bottom_navigation_components/rive_asset.dart';
import '../bottom_navigation_components/rive_utiles.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({super.key});

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  RiveAsset selectedTile = sideMenuTiles.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color(0xFF17203A),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopSectionInfo(
                name: "Amir Mohsen",
                profession: "Programmer",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: const TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ),
              ...sideMenuTiles.map(
                (menu) => SideBarMenuTile(
                  menu: menu,
                  riveOnInit: (artboard) {
                    StateMachineController controller =
                        RiveUtiles.getRiveController(
                      artboard,
                      stateMachineName: menu.stateMachineName,
                    );
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedTile = menu;
                    });
                  },
                  isActive: selectedTile == menu,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "HISTORY".toUpperCase(),
                  style: const TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ),
              ...sideMenuTiles2.map(
                (menu) => SideBarMenuTile(
                  menu: menu,
                  riveOnInit: (artboard) {
                    StateMachineController controller =
                        RiveUtiles.getRiveController(
                      artboard,
                      stateMachineName: menu.stateMachineName,
                    );
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedTile = menu;
                    });
                  },
                  isActive: selectedTile == menu,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopSectionInfo extends StatelessWidget {
  const TopSectionInfo({
    Key? key,
    required this.name,
    required this.profession,
  }) : super(key: key);
  final String name;
  final String profession;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(CupertinoIcons.person, color: Colors.white),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        profession,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
