import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yu_health/core/constants/app_enum.dart';
import 'package:yu_health/core/navigation.dart';

class RegisterPageProvider extends ChangeNotifier {
  final registerFormKey = GlobalKey<FormState>();
  // TextEditingController
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Register
  ResultState registerUserState = ResultState.noData;
  void registerUser() async {
    registerUserState = ResultState.loading;
    notifyListeners();

    Timer(const Duration(seconds: 2), () {
      registerUserState = ResultState.hasData;
      notifyListeners();

      if (navigatorKey.currentContext != null) {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(
            padding: EdgeInsets.all(12),
            content: Text(
              'Registration success, please login!',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            duration: Duration(milliseconds: 2000),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }

      Navigation.back();
    });
  }
}
