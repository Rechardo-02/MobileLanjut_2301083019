import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text("Image Widget"),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 500,
          color: Colors.amber,
          child: Image(
            image: AssetImage("images/logo.jpg"),
          ),
        ),
      ),
      )
    );
  }
}