import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera App',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}