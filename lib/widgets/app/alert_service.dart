/* ===============================================================
| Project : SIFR
| Page    : ALERT_SERVICE.DART
| Date    : 22-MAR-2023
|
*  ===============================================================*/

// Dependencies or Plugins - Models - Services - Global Functions
import 'package:flutter/material.dart';
import '../../config/state_key.dart';
import '../widget.dart';

//Alert Service Class
class AlertService {
  //Global Success Alert
  success(BuildContext context, String title, String message) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      width: double.infinity,
      content: Dialog(
        child: Column(
          children: [
            Text(title.toString().isEmpty ? 'Failed!' : title.toString()),
            Text(message.toString().isEmpty ? 'message!' : message.toString()),
          ],
        ),
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  //Global Failure Alert
  failure(BuildContext context, String? title, String message) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      width: double.infinity,
      content: Dialog(
        child: Column(
          children: [
            Text(title.toString().isEmpty ? 'Failed!' : title.toString()),
            Text(message.toString().isEmpty ? 'message!' : message.toString()),
          ],
        ),
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  //Global Warning Alert
  warn(BuildContext context, String? title, String message) {
    final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        width: double.infinity,
        content: Dialog(
          child: Column(
            children: [
              Text(title.toString().isEmpty ? 'Failed!' : title.toString()),
              Text(
                  message.toString().isEmpty ? 'message!' : message.toString()),
            ],
          ),
        ));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  //Global Error Alert
  error(String message) {
    final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        width: double.infinity,
        content: Dialog(
          child: Text(
              message.toString().isEmpty ? 'message!' : message.toString()),
        ));
    StateKey.snackBarKey.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
