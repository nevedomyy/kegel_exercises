import 'package:flutter/material.dart';
import 'kegel.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color.fromRGBO(46, 41, 78, 1),
        primaryColor: Color.fromRGBO(255, 212, 0, 1),
      ),
      home: Kegel(),
    );
  }
}