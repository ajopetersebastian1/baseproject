/* ===============================================================
| Project : SIFR
| Page    : BACKGROUND_PATTERN.DART
| Date    : 22-MAR-2023
|
*  ===============================================================*/

// Dependencies or Plugins - Models - Services - Global Functions
import 'package:baseproject/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// STATEFUL WIDGET
class BackgroundPattern extends StatefulWidget {
  final Widget childData;
  const BackgroundPattern({Key? key, required this.childData})
      : super(key: key);

  @override
  State<BackgroundPattern> createState() => _BackgroundPatternState();
}

// Background Pattern State Class
class _BackgroundPatternState extends State<BackgroundPattern> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Lottie animation background
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Lottie.asset(
              Assets.lottie
                  .background, // Ensure this is a .json file for Lottie animations
              fit: BoxFit.cover,
            ),
          ),
          // Content with SafeArea and SingleChildScrollView
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                bottom: MediaQuery.of(context).padding.bottom,
                left: 25,
                right: 25,
              ),
              child: widget.childData,
            ),
          ),
        ],
      ),
    );
  }
}
