import 'package:flutter/material.dart';
import 'package:baseproject/colors.dart';

import '../screens/card_limits.dart';
import 'custom_text_widget.dart';

class VisaCardwidget extends StatefulWidget {
  final int walletBalance;
  final String walletid;
  final String walletCurrency;
  const VisaCardwidget(
      {super.key,
      required this.walletBalance,
      required this.walletid,
      required this.walletCurrency});

  @override
  State<VisaCardwidget> createState() => _VisaCardwidgetState();
}

class _VisaCardwidgetState extends State<VisaCardwidget> {
  int switcherindex = 0;
  bool viewBalance = false;
  bool isSuspended = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Card(
            elevation: 4,
            shadowColor: kiconsColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: const BorderSide(width: 1, color: Colors.white)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              width: 240,
              height: 160,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'OMA Wallet ${widget.walletCurrency} ',
                      textcolor: Colors.white,
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTextWidget(
                      text: widget.walletid,
                      textcolor: Colors.white,
                      fontsize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 40,
                      child: viewBalance
                          ? Row(
                              children: [
                                CustomTextWidget(
                                  text:
                                      'Balance ${widget.walletBalance} ${widget.walletCurrency}',
                                  textcolor: Colors.white,
                                  fontsize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      viewBalance = false;
                                    });
                                  },
                                  child: Image.asset(
                                    'assets/images/eye_hide.png',
                                    height: 28,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            )
                          : ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  const EdgeInsets.all(
                                      8.0), // Adjust the padding to change the size
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(100,
                                      20), // Adjust the minimum size to change the size
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  viewBalance = true;
                                });
                              },
                              child:
                                  const CustomTextWidget(text: 'View balance'),
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const ViewCardLimits(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/card_limits.png',
                            height: 30,
                            color: Colors.white,
                          ),
                        ),
                        Switch(
                          value: isSuspended,
                          activeColor: Colors.red,
                          activeTrackColor: Colors.white,
                          inactiveThumbColor: Colors.green,
                          inactiveTrackColor: Colors.white,
                          onChanged: (bool value) {
                            setState(() {
                              isSuspended = value;
                            });
                          },
                        ),
                        CustomTextWidget(
                          text: isSuspended ? 'Unblocked' : 'Blocked',
                          textcolor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
