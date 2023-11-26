import 'package:awesome_app/src/pages/login/enums/input_type.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final InputType inputType;
  final VoidCallback onSubmitted;

  const CustomInput(
      {super.key,
      required this.label,
      required this.controller,
      required this.inputType,
      required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    bool isPassword = inputType == InputType.password;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            label,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          width: MediaQuery.sizeOf(context).width / 1.5,
          child: TextFormField(
            validator: (String? text) {
              if (text == null) {
                return "O campo deve ser preenchido!";
              }

              if (text.isEmpty) {
                return "O campo não pode ser vazio!";
              }

              if (text.length > 20) {
                return "O campo não pode ser conter mais de 20 caracteres.";
              }

              if (isPassword) {
                if (text.length <= 2) {
                  return "O campo precisa ter mais de 2 caracteres.";
                }

                bool passwordHasNotSpecialCharacters =
                    RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text);

                if (!passwordHasNotSpecialCharacters) {
                  return "A senha não pode conter caracteres especiais.";
                }
              }

              if (text.split(" ").last.isEmpty) {
                return "O campo não pode terminar com espaço.";
              }

              return null;
            },
            controller: controller,
            onFieldSubmitted: (String? text) => onSubmitted,
            onTapOutside: (PointerEvent? p) => FocusScope.of(context).unfocus(),
            maxLength: isPassword ? 20 : 100,
            obscureText: isPassword,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              prefixIcon: Icon(
                isPassword ? Icons.lock : Icons.person,
                size: 22,
              ),
              errorStyle: const TextStyle(color: Colors.white),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
