import 'package:coctail/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coctail App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Reggae',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
