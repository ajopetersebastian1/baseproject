import 'package:flutter/material.dart';
import 'package:baseproject/colors.dart';
import 'package:baseproject/widgets/bg_container.dart';

import '../models/cadrd_dropdown_model.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/container_with_border.dart';
import '../widgets/credit_card_wigget.dart';
import '../widgets/custom_text_widget.dart';

class AddMoneyToWallet extends StatefulWidget {
  const AddMoneyToWallet({super.key});

  @override
  State<AddMoneyToWallet> createState() => _AddMoneyToWalletState();
}

class _AddMoneyToWalletState extends State<AddMoneyToWallet> {
  List<DropdownItem> items = [
    DropdownItem(
        text: '87648794', cardType: 'VISA', cardNumber: '5487********9854'),
    DropdownItem(
        text: '65976445', cardType: 'MASTER', cardNumber: '9865********8563'),
    DropdownItem(
        text: '98564759', cardType: 'VISA', cardNumber: '6584********5684'),
  ];
  late DropdownItem selectedItem = items[1];
  var walletbalance = 1000;
  TextEditingController textEditingController =
      TextEditingController(text: '1000');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        padding: EdgeInsets.all(0),
        title: 'Add Money',
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BgContainer(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 20, right: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection:
                        Axis.horizontal, // Allow horizontal scrolling
                    child: Row(
                      children: [
                        VisaCardwidget(
                          walletBalance: walletbalance,
                          walletid: '976543785654676@oma',
                          walletCurrency: 'AED',
                        ),
                        VisaCardwidget(
                          walletBalance: 2000,
                          walletid: '976543785654676@oma',
                          walletCurrency: 'INR',
                        ),
                        // VisaCardwidget(
                        //   walletBalance: 300,
                        //   walletid: '976543785654676@oma',
                        //   walletCurrency: 'AED',
                        // ),
                      ],
                    ),
                  ),
                  // DottedBorderExample(),
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     border: Border(
                  //       top: BorderSide(
                  //         color: Colors.white, // You can change the color
                  //         width: 2.0,
                  //         // You can change the width
                  //         style: BorderStyle.solid,
                  //       ),
                  //       left: BorderSide(
                  //         color: Colors.black, // You can change the color
                  //         width: 2.0, // You can change the width
                  //         style: BorderStyle.solid,
                  //       ),
                  //       right: BorderSide(
                  //         color: Colors.black, // You can change the color
                  //         width: 2.0, // You can change the width
                  //         style: BorderStyle.solid,
                  //       ),
                  //       bottom: BorderSide(
                  //         color: Colors.black, // You can change the color
                  //         width: 2.0, // You can change the width
                  //         style: BorderStyle.solid,
                  //       ),
                  //     ),
                  //   ),
                  //   child: Text(
                  //     'This is a text view with a dashed border',
                  //     style: TextStyle(fontSize: 18),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextWidget(
                    text: 'Wallet balance 100 AED',
                    fontsize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  const CustomTextWidget(
                    text: 'Your wallet Balance is low',
                    textcolor: Colors.red,
                    fontsize: 14,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextWidget(text: 'Recommended'),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: textEditingController,
                    style: const TextStyle(color: ktextColor),
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      labelStyle: TextStyle(color: kiconsColor),
                      hintStyle: TextStyle(color: ktextColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: kborderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: kiconsColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: kborderColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      MyClickableContainer(
                        amount: '1000',
                        onTap: () {
                          setState(() {
                            textEditingController.text = '1000';
                          });
                        },
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      MyClickableContainer(
                        amount: '1500',
                        onTap: () {
                          setState(() {
                            textEditingController.text = '1500';
                          });
                        },
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      MyClickableContainer(
                        amount: '2000',
                        onTap: () {
                          setState(() {
                            textEditingController.text = '2000';
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: kiconsColor, width: 2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: DropdownButtonFormField<DropdownItem>(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      value: selectedItem,
                      onChanged: (DropdownItem? newValue) {
                        setState(() {
                          selectedItem = newValue!;
                        });
                      },
                      items: items.map<DropdownMenuItem<DropdownItem>>(
                          (DropdownItem item) {
                        return DropdownMenuItem<DropdownItem>(
                          value: item,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              CustomTextWidget(
                                text: item.cardNumber,
                                fontsize: 16,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                item.cardType == 'VISA'
                                    ? 'assets/images/visa.png'
                                    : 'assets/images/Mastercard.png',
                                height: 30,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF4F0665)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(
                              const Size(320.0, 50.0)),
                        ),
                        onPressed: () {
                          setState(() {
                            walletbalance = walletbalance +
                                int.parse(textEditingController.text);
                            _showOTPDialog(context);
                            //showCustomDialog(context);
                          });
                        },
                        child: const CustomTextWidget(
                          text: "Proceed to Topup",
                          fontsize: 18,
                          fontWeight: FontWeight.w900,
                          textcolor: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Function to show the custom alert dialog
void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFF4F0665),
        title: CustomTextWidget(
            text: 'Wallet Balance', textcolor: Colors.white, fontsize: 18),
        content: CustomTextWidget(
            text: 'THe Amount hasbeen Added to the Wallet',
            fontsize: 14,
            textcolor: Colors.white),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: CustomTextWidget(text: 'Close', textcolor: Colors.white),
          ),
        ],
      );
    },
  );
}

_showOTPDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFF4F0665),
        title: CustomTextWidget(
            text: 'Enter OTP', textcolor: Colors.white, fontsize: 18),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildOTPField(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                showCustomDialog(context);
                // TODO: Add your logic for OTP validation here
                // For simplicity, let's just print the entered OTP.
                _otpController.text = "";
                print(_otpController.text);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      );
    },
  );
}

TextEditingController _otpController = TextEditingController();

Widget _buildOTPField() {
  return TextField(
    controller: _otpController,
    keyboardType: TextInputType.number,
    maxLength: 6,
    style: TextStyle(color: Colors.white), // Set text color to white
    decoration: InputDecoration(
      labelText: 'OTP',
      hintText: 'Enter OTP',
      labelStyle: TextStyle(color: Colors.white), // Set label color to white
      hintStyle: TextStyle(color: Colors.white), // Set hint color to white
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Colors.white), // Set border color to white
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Colors.white), // Set border color to white
      ),
    ),
  );
}
