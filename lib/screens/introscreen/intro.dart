import 'package:flutter/material.dart';
import 'package:baseproject/screens/home_screen.dart';
import 'package:baseproject/screens/loginPage.dart';

import '../login_new.dart';
import 'intro_screen.dart';
import 'intro_screens.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  IntroState createState() => IntroState();
}

class IntroState extends State<Intro> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var screens = IntroScreens(
      onDone: () {
        Navigator.pushNamedAndRemoveUntil(
            context, "login", (Route<dynamic> route) => false);
      },
      onSkip: () {
        Navigator.pushNamedAndRemoveUntil(
            context, "login", (Route<dynamic> route) => false);
      },
      footerBgColor: Colors.blue.withOpacity(.8),
      activeDotColor: Colors.white,
      footerRadius: 18.0,
      indicatorType: IndicatorType.CIRCLE,
      slides: [
        IntroScreen(
          title: 'Add Moneyto Wallet',
          imageAsset: 'assets/images/link_cards.png',
          description:
              'Welcome to our seamless wallet experience! Say goodbye to the hassle of carrying cash by easily adding money to your wallet.',
          headerBgColor: Colors.white,
        ),
        IntroScreen(
          title: 'Pay Bills',
          headerBgColor: Colors.white,
          imageAsset: 'assets/images/bills_illustr.png',
          description:
              "Skip the lines, pay bills effortlessly, and never miss a due date with our user-friendly platform.",
        ),
        IntroScreen(
          title: 'Link Cards',
          headerBgColor: Colors.white,
          imageAsset: 'assets/images/add_accounts.png',
          description:
              "Top up your wallet with just a few taps. Link your card or account to make transactions a breeze.",
        ),
      ],
    );

    return Scaffold(
      body: screens,
    );
  }
}

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
      );
}
