// main.dart (permanece igual)
import 'package:flutter/material.dart';
import 'package:prova_mobile_1/login_screen.dart';
import 'package:prova_mobile_1/produtos/product_list_screen.dart';
import 'package:prova_mobile_1/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => ProductListScreen(),
      },
    );
  }
}
