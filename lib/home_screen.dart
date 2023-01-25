import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const Text(
              "Demo text",
              style: TextStyle(fontSize: 40),
            ),
            const DemoContainer(),
            const DemoContainer(),
            const DemoContainer(),
            const DemoContainer(),
            const DemoContainer(),
            const DemoContainer(),
            const DemoContainer(),
            const DemoContainer(),
            const DemoContainer(),
          ],
        ),
      ),
    );
  }
}

class DemoContainer extends StatelessWidget {
  const DemoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
