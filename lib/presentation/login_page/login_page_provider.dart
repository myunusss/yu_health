import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yu_health/core/app_routes.dart';
import 'package:yu_health/core/constants/app_enum.dart';
import 'package:yu_health/core/navigation.dart';

class LoginPageProvider extends ChangeNotifier {
  final loginFormKey = GlobalKey<FormState>();
  // TextEditingController
  final TextEditingController phoneController = TextEditingController();

  // Register
  ResultState loginUserState = ResultState.noData;
  void loginUser() async {
    loginUserState = ResultState.loading;
    notifyListeners();

    Timer(const Duration(seconds: 1), () {
      loginUserState = ResultState.hasData;
      notifyListeners();

      Navigation.intentAndRemove(AppRoutes.kHomeRoute);
    });
  }
}
