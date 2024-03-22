
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "حسابي",
          style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
