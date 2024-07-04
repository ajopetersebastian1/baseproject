import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baseproject/screens/profile_screen.dart';
import 'package:baseproject/widgets/custom_text_widget.dart';

import '../screens/qrscanner/qr_scanner.dart';

class AppScaffold extends StatefulWidget {
  final bool eneableScanner;
  final String title;
  final Widget child;
  final EdgeInsetsGeometry padding;
  const AppScaffold(
      {super.key,
      required this.child,
      this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      required this.title,
      this.eneableScanner = false});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  var _bottomNavIndex = 0;
  // final autoSizeGroup = AutoSizeGroup();
  final iconList = [
    Icons.home,
    Icons.person,
    // Icons.brightness_6,
    // Icons.brightness_7,
  ];
  final nameList = [
    'Home',
    'profile'
    // Icons.brightness_6,
    // Icons.brightness_7,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff401e66),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        leading: widget.eneableScanner
            ? null
            : InkResponse(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     opacity: 0.3,
        //     image: AssetImage(
        //       'assets/images/appbg.jpg',
        //     ),
        //     fit: BoxFit
        //         .cover, // This will make the image cover the entire Container.
        //   ),
        // ),
        child: Padding(
          padding: widget.padding,
          child: widget.child,
        ),
      ),
      floatingActionButton: widget.eneableScanner
          ? FloatingActionButton(
              backgroundColor: const Color(0xFF4F0665),
              child: const Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
              ),
              onPressed: () {
                // Navigator.pushReplacement<void, void>(
                //   context,
                //   MaterialPageRoute<void>(
                //     builder: (BuildContext context) => const QRSCanner(),
                //   ),
                // );
                Navigator.push<void>(
                  context,
                  CupertinoPageRoute<void>(
                    builder: (BuildContext context) => const QRSCanner(),
                  ),
                );
              },
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        backgroundGradient:
            LinearGradient(colors: [Color(0xFF65197C), Color(0xFF65197C)]),
        tabBuilder: (int index, bool isActive) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: Colors.white,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomTextWidget(
                  textcolor: Colors.white,
                  // style: TextStyle(color: color),
                  text: nameList[index],
                ),
              )
            ],
          );
        },
        backgroundColor: Color(0xFFC8ADAD4),
        activeIndex: _bottomNavIndex,

        //splashColor: Color(0xFFB71C1C4),
        // notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 50,
        rightCornerRadius: 50, notchMargin: 18,
        onTap: (index) => setState(() {
          _bottomNavIndex = index;
          if (index == 1) {
            Navigator.push<void>(
              context,
              CupertinoPageRoute<void>(
                builder: (BuildContext context) => ProfilePage(),
              ),
            );
          }
          print(index);
        }),
        shadow: BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 12,
          spreadRadius: 0.5,
        ),
      ),
    );
  }
}
