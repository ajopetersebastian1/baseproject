import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:baseproject/colors.dart';
import 'package:baseproject/widgets/bg_container.dart';
import 'package:baseproject/widgets/custom_text_widget.dart';

import '../models/cadrd_dropdown_model.dart';
import '../widgets/app_scaffold.dart';

class LinkBank extends StatefulWidget {
  const LinkBank({
    super.key,
  });

  @override
  _LinkBankState createState() => _LinkBankState();
}

class _LinkBankState extends State<LinkBank> {
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
      title: 'Link Bank',
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
                      text: 'Link Your Bank',
                      fontsize: 20,
                    ),
                    Image.asset(
                      'assets/images/add_accounts.png',
                      height: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          CustomTextWidget(
                              text: 'Fill the bank detials',
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
                    FormBuilderTextField(
                      // validator: [FormBuilderValidators.email()],
                      decoration: InputDecoration(labelText: 'Mpin'),
                      name: 'mPin',
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color(0xFF290741)), // Set the background color
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20.0), // Set the rounded corner radius
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                            const Size(320.0, 50.0)), // Set the custom size
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          // Form is valid; you can process the data here.
                          print(_formKey.currentState!.value);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Link Account',
                            style: TextStyle(color: Colors.white),
                          ),
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
