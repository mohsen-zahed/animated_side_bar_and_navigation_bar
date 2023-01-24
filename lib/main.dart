import 'package:animated_side_bar_and_navigation_bar/constants.dart';
import 'package:animated_side_bar_and_navigation_bar/list.dart';
import 'package:animated_side_bar_and_navigation_bar/rive_asset.dart';
import 'package:animated_side_bar_and_navigation_bar/rive_utiles.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'components/rive.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
