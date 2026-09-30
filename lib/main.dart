import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screens.dart';



void main(){
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const new({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Complete App",
      home: HomeScreen(),
    );
  }
}
