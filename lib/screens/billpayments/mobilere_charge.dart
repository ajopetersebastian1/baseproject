import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:baseproject/models/cadrd_dropdown_model.dart';
import 'package:baseproject/screens/home_screen.dart';
import 'package:baseproject/widgets/app_scaffold.dart';
import 'package:baseproject/widgets/bg_container.dart';
import 'package:baseproject/widgets/custom_text_widget.dart';
import 'package:quickalert/quickalert.dart';

import '../../../colors.dart';

class MobileBill extends StatefulWidget {
  const MobileBill({super.key});

  @override
  State<MobileBill> createState() => _MobileBillState();
}

class _MobileBillState extends State<MobileBill> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  TextEditingController billAmountControler = TextEditingController();
  TextEditingController billnameController = TextEditingController();
  List<DropdownItem> items = [
    DropdownItem(
        text: '87648794', cardType: 'VISA', cardNumber: '5487********9854'),
    DropdownItem(
        text: '65976445', cardType: 'MASTER', cardNumber: '9865********8563'),
    DropdownItem(
        text: '98564759', cardType: 'VISA', cardNumber: '6584********5684'),
  ];
  late DropdownItem selectedItem = items[1];
  bool eneabledSearch = true;
  bool isNumeric(String? input) {
    if (input == null) {
      return false;
    }
    final RegExp numeric = RegExp(r'^[0-9]+$');
    return numeric.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Bill Payments',
      child: ListView(
        children: [
          BgContainer(
            backgroundColor: Colors.white.withOpacity(0.5),
            child: FormBuilder(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    const CustomTextWidget(
                      text: 'Pay Your Phone Bill',
                      fontsize: 20,
                    ),
                    Image.asset(
                      'assets/images/billpay.png',
                      height: 220,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          CustomTextWidget(
                              text: 'Fill the  detials',
                              fontsize: 22,
                              fontWeight: FontWeight.w500,
                              textcolor: kiconsColor1),
                        ],
                      ),
                    ),
                    FormBuilderTextField(
                      decoration: InputDecoration(
                          labelText: 'Enter Your Phone number',
                          suffixIcon: GestureDetector(
                            child: Icon(Icons.search),
                            onTap: () {
                              setState(() {
                                eneabledSearch = false;
                                billAmountControler.text = '200 AED';
                                billnameController.text = 'Etisalat ';
                              });
                            },
                          )),
                      name: 'Bill number',
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      //enabled: eneabledSearch,
                      controller: billnameController,
                      decoration:
                          const InputDecoration(labelText: 'Service provider'),
                      name: 'Billername',
                    ),
                    FormBuilderTextField(
                      //enabled: eneabledSearch,
                      controller: billAmountControler,
                      decoration: const InputDecoration(labelText: 'Amount'),
                      name: 'BillAmount',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          CustomTextWidget(
                              text: 'PAy Via',
                              fontsize: 16,
                              fontWeight: FontWeight.w500,
                              textcolor: Theme.of(context).hintColor),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: kiconsColor, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: DropdownButtonFormField<DropdownItem>(
                        decoration: InputDecoration(
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
                                SizedBox(
                                  width: 20,
                                ),
                                CustomTextWidget(
                                  text: item.cardNumber,
                                  fontsize: 16,
                                ),
                                SizedBox(
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
                    const SizedBox(height: 20),
                    if (!eneabledSearch)
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.saveAndValidate()) {
                            print(_formKey.currentState!.value);

                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text: 'Mobile Bill Payment Suceess',
                              autoCloseDuration: const Duration(seconds: 2),
                              showConfirmBtn: false,
                            );
                            Future.delayed(Duration(seconds: 2)).then((value) {
                              Navigator.push<void>(
                                context,
                                CupertinoPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const HomeScreen(),
                                ),
                              );
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Pay'),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
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
