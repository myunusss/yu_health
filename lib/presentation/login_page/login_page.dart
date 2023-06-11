import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/core/app_routes.dart';
import 'package:yu_health/presentation/login_page/login_page_provider.dart';
import 'package:yu_health/presentation/login_page/widgets/phone_field_widget.dart';
import 'package:dartz/dartz.dart' as dartz;

import '../../core/constants/app_enum.dart';
import '../../core/constants/asset_constants.dart';
import '../../core/navigation.dart';
import '../widgets/blocked_loading_indicator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
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
                  Selector<LoginPageProvider, dartz.Tuple2<TextEditingController, GlobalKey<FormState>>>(
                    selector: (_, state) => dartz.tuple2(state.phoneController, state.loginFormKey),
                    builder: (_, data, child) {
                      return Form(
                        key: data.value2,
                        child: Column(
                          children: [
                            PhoneFieldWidget(controller: data.value1),
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
                                if (data.value2.currentState!.validate()) {
                                  context.read<LoginPageProvider>().loginUser();
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 24, color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Tidak memiliki akun? '),
                                TextButton(
                                  onPressed: () {
                                    Navigation.intent(AppRoutes.kRegisterRoute);
                                  },
                                  child: const Text('Daftar Sekarang'),
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
        Selector<LoginPageProvider, bool>(
          selector: (_, state) => state.loginUserState == ResultState.loading,
          builder: (_, isLoading, child) => isLoading ? const BlockedLoadingIndicator() : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
