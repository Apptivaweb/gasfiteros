import 'package:flutter/material.dart';
import 'package:gasfitero/pantallaCategoria.dart';
import 'package:gasfitero/pantallaInicio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  pantallaInicio(),
    );
  }
}
