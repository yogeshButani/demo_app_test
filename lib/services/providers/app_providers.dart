import 'package:demo_app/services/providers/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static MultiProvider getProviders({required Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsProvider(),
        ),
      ],
      child: child,
    );
  }
}
