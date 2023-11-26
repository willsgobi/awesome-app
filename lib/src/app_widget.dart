import 'package:awesome_app/src/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginPage());
  }
}
