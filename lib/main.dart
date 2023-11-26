import 'package:awesome_app/src/app_widget.dart';
import 'package:awesome_app/src/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Awesome App",
      theme: ThemeData(primaryColor: darkBlue),
      home: const AppWidget(),
    );
  }
}
