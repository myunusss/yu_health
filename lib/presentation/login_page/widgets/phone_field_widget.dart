import 'package:flutter/material.dart';

class PhoneFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const PhoneFieldWidget({
    super.key,
    required this.controller,
  });

  bool isPhoneNumberValid(String number) {
    return (number.contains(RegExp(r'^[0-9]{8,10}$')));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // TODO uncomment before release
      // keyboardType: TextInputType.phone,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: '8587132103',
        hintStyle: TextStyle(color: Colors.grey.shade500),
        labelText: 'Phone Number',
        prefixIcon: const Icon(Icons.phone_android),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      maxLength: 10,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone number tidak boleh kosong';
        }

        if (!isPhoneNumberValid(value)) {
          return 'Input max 10 chars and numbers only';
        }
        return null;
      },
    );
  }
}
