import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// ignore: unused_import
import 'home.dart';
import 'tasks.dart';
// roller_list
// intl
// sqflite
// lets build

void main(List<String> args) {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
          primaryColor: const Color.fromARGB(255, 168, 154, 0),
          primarySwatch: Colors.blueGrey),
      theme: ThemeData(
        primaryColor: Colors.amber,
        primarySwatch: Colors.amber,
      ),
      // ignore: prefer_const_constructors
      home: AllTasks(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "Day Schedules",
    );
  }
}
