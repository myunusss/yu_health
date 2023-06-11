import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/core/constants/app_enum.dart';
import 'package:yu_health/core/navigation.dart';
import 'package:yu_health/presentation/login_page/widgets/email_field_widget.dart';
import 'package:yu_health/presentation/login_page/widgets/phone_field_widget.dart';
import 'package:yu_health/presentation/register_page/register_page_provider.dart';
import 'package:yu_health/presentation/widgets/blocked_loading_indicator.dart';

import '../../core/constants/asset_constants.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
            centerTitle: true,
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Hero(
                    tag: 'yu_health_logo',
                    createRectTween: (begin, end) {
                      return MaterialRectArcTween(begin: begin, end: end);
                    },
                    child: Image.asset(
                      AssetConstants.yuHealthLogoBase,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 140,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Consumer<RegisterPageProvider>(
                    builder: (context, state, _) {
                      return Form(
                        key: state.registerFormKey,
                        child: Column(
                          children: [
                            PhoneFieldWidget(controller: state.phoneController),
                            const SizedBox(height: 12),
                            EmailFieldWidget(controller: state.emailController),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                if (state.registerFormKey.currentState!.validate()) {
                                  state.registerUser();
                                }
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(fontSize: 24, color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Sudah memiliki akun? '),
                                TextButton(
                                  onPressed: () {
                                    Navigation.back();
                                  },
                                  child: const Text('Login'),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        // Loading dialog
        Selector<RegisterPageProvider, bool>(
          selector: (_, state) => state.registerUserState == ResultState.loading,
          builder: (_, isLoading, child) => isLoading ? const BlockedLoadingIndicator() : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
