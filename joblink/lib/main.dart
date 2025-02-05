import 'package:flutter/material.dart';
import 'screens/auth/register_screen.dart';
import 'package:sqflite/sqflite_dev.dart';
import 'dart:io' show Platform;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobLink - Clientes',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => RegisterScreen(),
    },
    );

  }
}
