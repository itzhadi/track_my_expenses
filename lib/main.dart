import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.black,
          appBarTheme: AppBarTheme(
            color: Colors.black12,
          )),
      home: Column(
        children: [
          AppBar(
            title: Text("Track Expenses",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
