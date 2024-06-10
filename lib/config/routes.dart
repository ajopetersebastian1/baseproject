// ignore_for_file: unused_import

/* ===============================================================
| Project : SIFR
| Page    : ROUTES.DART
| Date    : 22-MAR-2023
|
*  ===============================================================*/

// Dependencies or Plugins - Models - Services - Global Functions
import 'package:baseproject/pages/monitoring/switch_monitoring.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/home/home_page.dart';
import '../pages/pages.dart';

import '../pages/users/login/login_page.dart';
import '../providers/providers.dart';

// Custom route Class
class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    return CupertinoPageRoute(builder: (context) {
      print(settings.name);
      // return MaterialPageRoute(builder: (context) {
      final isOnline = Provider.of<ConnectivityProvider>(context).isOnline;
      if (!isOnline) {
        return const Scaffold(
          body: Center(child: Text("No Internet")),
        );
      }
      switch (settings.name) {
        // --- USERS ---

        case "splash":
          return const SplashScreen();
        case "login":
          return const LoginPage();
        case "home":
          return const HomePage();
        case "monitoring":
          return const SwitchMonitoring();
      }
      return const Scaffold(
        body: Center(child: Text("wrong Route")),
      );
    });
  }
}
