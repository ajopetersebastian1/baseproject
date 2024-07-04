import 'package:baseproject/pages/monitoring/switch_monitoring.dart';
import 'package:baseproject/screens/home_screen.dart';
import 'package:baseproject/screens/introscreen/intro.dart';
import 'package:baseproject/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        case "intro":
          return const Intro();
        case "home":
          return const HomeScreen();
        case "splash":
          return const SplashScreen();
        case "login":
          return const LoginPage();
        case "signUp":
          return const SignUp();
        case "monitoring":
          return const SwitchMonitoring();
      }
      return const Scaffold(
        body: Center(child: Text("wrong Route")),
      );
    });
  }
}
