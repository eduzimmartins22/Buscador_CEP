import 'package:flutter/material.dart';
import '/ui/cep__screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Consulta de CEP',
      home: CepSearchScreen(),
    );
  }
}
