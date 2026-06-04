import 'package:flutter/material.dart';

class MenuRestoInfoPage extends StatelessWidget {
  const MenuRestoInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Info"),
      ),
      body: Center(
        child: Text("Menu Info Content"),
      ),
    );
  }
}