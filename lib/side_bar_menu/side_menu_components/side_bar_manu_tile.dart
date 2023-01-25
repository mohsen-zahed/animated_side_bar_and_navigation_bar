import 'package:animated_side_bar_and_navigation_bar/bottom_navigation_components/rive_asset.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideBarMenuTile extends StatelessWidget {
  const SideBarMenuTile({
    Key? key,
    required this.menu,
    required this.press,
    required this.riveOnInit,
    required this.isActive,
  }) : super(key: key);

  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              width: isActive ? 288 : 0,
              height: 56,
              left: 0,
              curve: Curves.fastOutSlowIn,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 24, 166, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                width: 35,
                height: 35,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveOnInit,
                ),
              ),
              title: Text(
                menu.title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
