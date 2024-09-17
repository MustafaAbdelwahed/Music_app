import 'package:flutter/material.dart';
import 'package:music_app/home/presentation/view/home_view.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});
  static const routeName = "test";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, HomeView.routeName);
            },
            child: const Text("push")),
      ),
    );
  }
}
