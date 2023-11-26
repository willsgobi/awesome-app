import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            launchUrl(
              Uri.parse("https://www.google.com.br"),
              mode: LaunchMode.externalApplication,
            );
          },
          child: const Text(
            "Política de Privacidade",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
