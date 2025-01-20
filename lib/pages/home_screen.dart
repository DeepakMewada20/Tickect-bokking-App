import 'package:flutter/material.dart';
import 'package:my_movie_ticket/controllers/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          AuthController.instence.signOut();
        },
        child: const Text("Home Screen"),
      ),
    ));
  }
}
