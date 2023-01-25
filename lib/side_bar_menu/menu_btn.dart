import 'package:flutter/material.dart';

class MenuBtn extends StatelessWidget {
  const MenuBtn({
    Key? key,
    required this.isMenuClosed,
    required this.onTap,
  }) : super(key: key);

  final bool isMenuClosed;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(left: 16, top: 15),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: isMenuClosed
              ? const Icon(
                  Icons.menu,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
