import 'package:animated_side_bar_and_navigation_bar/list.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'rive_asset.dart';
import 'rive_utiles.dart';

class BottomVerticalWidget extends StatefulWidget {
  const BottomVerticalWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<BottomVerticalWidget> createState() => _BottomVerticalWidgetState();
}

class _BottomVerticalWidgetState extends State<BottomVerticalWidget> {
  RiveAsset selectedBottomNav = bottomNavs.first;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bottomNavs[widget.index].input!.change(true);
        if (bottomNavs[widget.index] != selectedBottomNav) {
          setState(() {
            selectedBottomNav = bottomNavs[widget.index];
          });
        }
        Future.delayed(
          const Duration(seconds: 1),
          () {
            bottomNavs[widget.index].input!.change(false);
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: selectedBottomNav == bottomNavs[widget.index] ? 20 : 0,
            height: 5,
            decoration: BoxDecoration(
              color: const Color(0xFF81B4FF),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 36,
            height: 36,
            child: Opacity(
              opacity: bottomNavs[widget.index] == selectedBottomNav ? 1 : 0.5,
              child: RiveAnimation.asset(
                bottomNavs.first.src,
                artboard: bottomNavs[widget.index].artboard,
                onInit: (artboard) {
                  StateMachineController controller =
                      RiveUtiles.getRiveController(
                    artboard,
                    stateMachineName: bottomNavs[widget.index].stateMachineName,
                  );
                  setState(() {
                    bottomNavs[widget.index].input =
                        controller.findSMI("active") as SMIBool;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
