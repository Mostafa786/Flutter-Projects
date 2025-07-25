import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(appBarTheme: AppBarTheme(foregroundColor: Colors.white)),
      debugShowCheckedModeBanner: false,
       home: Scaffold(body: HomePage()),
    );
  }
}
