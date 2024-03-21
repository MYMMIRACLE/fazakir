import 'package:flutter/material.dart';


class AzkarCardScreen extends StatefulWidget {
  const AzkarCardScreen({super.key});

  @override
  State<AzkarCardScreen> createState() => _AzkarCardScreenState();
}

class _AzkarCardScreenState extends State<AzkarCardScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final dynamic data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Center(child: Text(data)),
    );
  }
}
