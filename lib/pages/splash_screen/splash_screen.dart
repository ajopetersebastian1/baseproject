/* ===============================================================
| Project : SIFR
| Page    : SPLASH_SCREEN.DART
| Date    : 21-MAR-2023
|
*  ===============================================================*/

// Dependencies or Plugins - Models - Services - Global Functions
import 'dart:async';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:freerasp/freerasp.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baseproject/storage/secure_storage.dart';

import '../../config/config.dart';

// SPLASH SCREEN STATEFUL WIDGET
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// SPLASH SCREEN - State Class
class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false; // DECLARE LOGIN VARIABLE
  LocalAuthentication auth = LocalAuthentication();
  bool _result = true;
  // CustomAlert customAlert = CustomAlert();
  // AlertService alertService = AlertService();

  // Init function for page Initialization
  @override
  void initState() {
    // isRooted();
    Future.delayed(const Duration(seconds: 0), () {
      getValidationData();
    });
    super.initState();
  }

  Future getValidationData() async {
    debugPrint('--- Splash Screen ---');
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    bool? isLogged = sharedPreferences.getBool('isLogged') ?? false;
    String lastLogin = sharedPreferences.getString('lastLogin').toString();
    isLoggedIn = isLogged;
    if (sharedPreferences.getString('lastLogin') != null) {
      DateTime dt1 = DateTime.parse(lastLogin);
      DateTime now = DateTime.now();
      DateTime dt2 =
          DateTime.parse(DateFormat('yyyy-MM-dd HH:mm:ss').format(now));
      Duration diff = dt2.difference(dt1);

      BoxStorage boxStorage = BoxStorage();
      // boxStorage.save('isEnableBioMetric', false);
      List check = await Global.availableBiometrics();
      if (check.isEmpty) {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, 'home');
      } else {
        bool isEnableBioMetric = boxStorage.get('isEnableBioMetric') ?? false;
        if (isEnableBioMetric) {
          var authentication = await Global.authenticate();
          if (authentication && authentication != null) {
            if (!mounted) return;
            Navigator.pushReplacementNamed(context, 'home');
          } else if (authentication == false) {
            SystemNavigator.pop();
          } else {
            if (!mounted) return;
            Navigator.pushReplacementNamed(context, 'login');
          }
        } else {
          if (diff.inHours >= 4) {
            if (!mounted) return;
            Navigator.pushNamedAndRemoveUntil(
                context, 'loginWithPin', (route) => false);
          } else if (isLoggedIn) {
            if (!mounted) return;
            Navigator.pushReplacementNamed(context, 'home');
          } else {
            if (!mounted) return;
            Navigator.pushReplacementNamed(context, 'login');
          }
        }
      }
    } else {
      if (isLoggedIn == false) {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, 'login');
      } else {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, 'home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/logo/logo1.png'),
      logoWidth: 150,
      title: Text(
        "Withdraw Cash",
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      showLoader: false,
      // navigator: isLoggedIn == false ? const LoginPage() : const HomePage(),
      navigator: dynamicNavigation(),
      durationInSeconds: 5,
    );
  }

  dynamicNavigation() async {
    debugPrint("--- Dynamic Navigation ---");
    return isLoggedIn == false
        ? const Scaffold(
            body: Center(child: Text("logged in")),
          )
        : const Scaffold(
            body: Center(child: Text("Not logged in")),
          );
  }
}
