import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const EmailFieldWidget({
    super.key,
    required this.controller,
  });

  bool isEmailValid(String email) {
    return EmailValidator.validate(email);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: 'turmudi.yunus@gmail.com',
        hintStyle: TextStyle(color: Colors.grey.shade500),
        labelText: 'Email',
        prefixIcon: const Icon(Icons.email_outlined),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email tidak boleh kosong';
        }

        if (isEmailValid(value) == false) {
          return 'Format email salah';
        }

        return null;
      },
    );
  }
}
