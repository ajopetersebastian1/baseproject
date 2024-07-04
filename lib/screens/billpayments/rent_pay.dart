import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:baseproject/colors.dart';
import 'package:baseproject/widgets/bg_container.dart';
import 'package:baseproject/widgets/custom_text_widget.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../models/cadrd_dropdown_model.dart';
import '../../widgets/app_scaffold.dart';
import '../home_screen.dart';

class RentPayment extends StatefulWidget {
  const RentPayment({
    super.key,
  });

  @override
  _RentPaymentState createState() => _RentPaymentState();
}

class _RentPaymentState extends State<RentPayment> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  TextEditingController textEditingController =
      TextEditingController(text: '1000');

  List<DropdownItem> items = [
    DropdownItem(
        text: '87648794', cardType: 'VISA', cardNumber: '5487********9854'),
    DropdownItem(
        text: '65976445', cardType: 'MASTER', cardNumber: '9865********8563'),
    DropdownItem(
        text: '98564759', cardType: 'VISA', cardNumber: '6584********5684'),
  ];
  late DropdownItem selectedItem = items[1];
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
      title: 'Rent Payment',
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
                    CustomTextWidget(
                      text: 'Pay Your Rent',
                      fontsize: 20,
                    ),
                    Image.asset(
                      'assets/images/billpay.png',
                      height: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          CustomTextWidget(
                              text: 'BankAccount detials',
                              fontsize: 22,
                              fontWeight: FontWeight.w500,
                              textcolor: kiconsColor1),
                        ],
                      ),
                    ),
                    FormBuilderTextField(
                      // validator: [FormBuilderValidators.email()],
                      decoration:
                          InputDecoration(labelText: 'Account Holder Name'),
                      name: 'AccountHolderName',
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      // validator: [FormBuilderValidators.email()],
                      decoration: InputDecoration(labelText: 'Account Number'),
                      name: 'Account Number',
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      // validator: [FormBuilderValidators.email()],
                      decoration: InputDecoration(labelText: 'Bank Name'),
                      name: 'bankName',
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (input) {
                        if (isNumeric(input) || input!.isEmpty) {
                          return null;
                        } else {
                          return 'Please enter only numbers.';
                        }
                      },
                      decoration: InputDecoration(labelText: 'IBAN Number'),
                      name: 'IBAN Number',
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        if (true) {
                          print(_formKey.currentState!.value);

                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text: 'Rent Payment Suceess',
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
                          Text('Pay Rent'),
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
