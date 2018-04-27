import 'package:crypto_cat/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new CryptoCatApp());
}

class CryptoCatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Cryto Cat",
      home: new HomeScreen()
    );
  }
}

