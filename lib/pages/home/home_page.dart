/* ===============================================================
| Project : SIFR
| Page    : HOME_PAGE.DART
| Date    : 21-MAR-2023
|
*  ===============================================================*/

// Dependencies or Plugins - Models - Services - Global Functions
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../services/services.dart';
import '../../storage/secure_storage.dart';
import '../../widgets/widget.dart';

// STATEFUL WIDGET
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// Home State Class
class _HomePageState extends State<HomePage> {
  AlertService alertService = AlertService();
  CustomAlert customAlert = CustomAlert();

  UserServices userServices = UserServices();

  BoxStorage boxStorage = BoxStorage();

  // LOCAL VARIABLE DECLARATION

  // Init function for page Initialization
  @override
  void initState() {
    disableCapture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Scaffold(
          floatingActionButton: Icon(Icons.refresh),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: height * 0.3,
                automaticallyImplyLeading: false,
                elevation: 10,
                pinned: true,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Theme.of(context).primaryColor,
                  statusBarIconBrightness: Theme.of(context).brightness,
                  statusBarBrightness: Theme.of(context).brightness,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  background: Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Image.asset(
                        'assets/screen/pay_cash.png',
                        fit: BoxFit.contain,
                        height: height * 0.25,
                      ),
                    ],
                  )),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return Column(
                      children: [Text("hjhj")],
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> disableCapture() async {
    //disable screenshots and record screen in current screen
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  // BACK BUTTON ACTION
  _onWillPop(BuildContext context) async {
    bool? exitResult = customAlert.displayDialogConfirm(context,
        'Please confirm', 'Do you want to exit the app?', onTapConfirm);
    return exitResult ?? false;
  }

  void onTapConfirm() {
    Navigator.of(context).pop(false);
    SystemNavigator.pop();
  }

  checkAndRequestLocationPermissions() async {
    var status = await Permission.location.status;
    print(status);
    Navigator.pushNamed(context, 'nearByLocation');

    if (!status.isGranted) {
      openAppSettings();
    } else {
      Navigator.pushNamed(context, 'nearByLocation');
    }
  }
}
