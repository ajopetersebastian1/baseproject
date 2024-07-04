import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:baseproject/colors.dart';
import 'package:baseproject/screens/home_screen.dart';
import 'package:baseproject/widgets/bg_container.dart';
import 'package:baseproject/widgets/custom_text_widget.dart';

import '../models/cadrd_dropdown_model.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/container_with_border.dart';

class MoneyTranfer extends StatefulWidget {
  const MoneyTranfer({
    super.key,
  });

  @override
  _MoneyTranferState createState() => _MoneyTranferState();
}

class _MoneyTranferState extends State<MoneyTranfer> {
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
      title: 'Money Transfer',
      child: BgContainer(
        backgroundColor: Colors.white.withOpacity(0.5),
        child: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                CustomTextWidget(
                  text: 'Send Money',
                  fontsize: 20,
                ),
                Image.asset('assets/images/money_transfer.jpg'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      CustomTextWidget(
                          text: 'Send Via',
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
                FormBuilderTextField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (input) {
                    if (isNumeric(input) || input!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Please enter only numbers.';
                    }
                  },
                  decoration:
                      InputDecoration(labelText: 'Benficiary Account Number'),
                  name: 'Benficiary Account Number',
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
                  decoration: InputDecoration(labelText: 'SWIFT Code'),
                  name: 'SWIFT Code',
                ),
                SizedBox(height: 20),
                FormBuilderTextField(
                  // validator: [FormBuilderValidators.email()],
                  decoration: InputDecoration(labelText: 'Remarks'),
                  name: 'Remarks',
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(kiconsColor)),
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      // Form is valid; you can process the data here.
                      print(_formKey.currentState!.value);
                    }
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Submit',
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
    );
  }
}
