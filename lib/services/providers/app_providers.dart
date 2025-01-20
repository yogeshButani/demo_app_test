import 'package:demo_app/services/providers/dashboard_provider.dart';
import 'package:demo_app/services/providers/home_provider.dart';
import 'package:demo_app/services/providers/my_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static MultiProvider getProviders({required Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MyCartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
      ],
      child: child,
    );
  }
}
