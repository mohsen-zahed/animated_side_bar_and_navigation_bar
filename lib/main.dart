import 'dart:math';
import 'package:animated_side_bar_and_navigation_bar/constants.dart';
import 'package:animated_side_bar_and_navigation_bar/list.dart';
import 'package:animated_side_bar_and_navigation_bar/bottom_navigation_components/rive_asset.dart';
import 'package:animated_side_bar_and_navigation_bar/side_bar_menu/menu_btn.dart';
import 'package:animated_side_bar_and_navigation_bar/side_bar_menu/side_bar_menu.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_components/bottom_vertical_widget.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  RiveAsset selectedBottomNav = bottomNavs.first;
  bool isMenuClosed = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          // Home Screen Section ...
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            width: 288,
            left: isMenuClosed ? -288 : 0,
            height: MediaQuery.of(context).size.height,
            child: const SideBarMenu(),
          ),
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 40 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  child: HomeScreen(),
                ),
              ),
            ),
          ),
          // Menu Button ...
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: isMenuClosed ? 0 : 240,
            child: MenuBtn(
              isMenuClosed: isMenuClosed,
              onTap: () {
                setState(() {
                  isMenuClosed = !isMenuClosed;
                  if (isMenuClosed) {
                    _animationController.reverse();
                  } else {
                    _animationController.forward();
                  }
                });
              },
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
              color: backgroundColor2.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomNavs.length,
                  (index) => BottomVerticalWidget(index: index),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
