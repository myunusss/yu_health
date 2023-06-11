import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yu_health/core/app_theme.dart';
import 'package:yu_health/core/navigation.dart';

import 'app_routes.dart';
import 'constants/asset_constants.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // set orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      precacheImage(const AssetImage(AssetConstants.yuHealthLogoBase), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yu Health',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.kInitialRoute,
      navigatorKey: navigatorKey,
    );
  }
}
