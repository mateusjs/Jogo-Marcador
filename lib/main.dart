import 'package:flutter/material.dart';
import 'package:foda_se/src/marcador.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcador de Foda-se',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Marcador()
    );
  }
}


