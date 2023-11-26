import 'package:awesome_app/src/pages/home/home_page.dart';
import 'package:awesome_app/src/pages/login/enums/input_type.dart';
import 'package:awesome_app/src/pages/login/widgets/custom_input.dart';
import 'package:awesome_app/src/pages/shared_widgets/privacy_policy.dart';
import 'package:awesome_app/src/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [darkBlue, aqua],
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomInput(
                label: "Usuário",
                controller: emailController,
                inputType: InputType.user,
                onSubmitted: () => print(""),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomInput(
                label: "Senha",
                controller: passwordController,
                inputType: InputType.password,
                onSubmitted: () => print(""),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: green, fixedSize: const Size(150, 35)),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              const PrivacyPolicy()
            ],
          ),
        ),
      ),
    );
  }
}
