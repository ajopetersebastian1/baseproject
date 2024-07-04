import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:baseproject/colors.dart';
import 'package:baseproject/widgets/bg_container.dart';
import 'package:baseproject/widgets/custom_text_widget.dart';

import '../models/cadrd_dropdown_model.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/container_with_border.dart';

class QRPaymentPage extends StatefulWidget {
  final String qrdata;
  const QRPaymentPage({
    super.key,
    required this.qrdata,
  });

  @override
  _QRPaymentPageState createState() => _QRPaymentPageState();
}

class _QRPaymentPageState extends State<QRPaymentPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  TextEditingController textEditingController =
      TextEditingController(text: '1000');
  late TextEditingController qrdatacontroler;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    qrdatacontroler = TextEditingController(text: widget.qrdata);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'QRPay',
      child: BgContainer(
        backgroundColor: Colors.white.withOpacity(0.5),
        child: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                const CustomTextWidget(
                  text: 'Send Money',
                  fontsize: 20,
                ),
                Image.asset(
                  'assets/images/money_transfer.jpg',
                  height: 220,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  enabled: false,
                  controller: qrdatacontroler,
                  style: const TextStyle(color: ktextColor),
                  decoration: const InputDecoration(
                    labelText: 'Send To',
                    labelStyle: TextStyle(color: kiconsColor),
                    hintStyle: TextStyle(color: ktextColor),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: kiconsColor, width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
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
                const SizedBox(
                  height: 10,
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
                      borderSide: BorderSide(color: kborderColor, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: kiconsColor, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: kborderColor),
                    ),
                  ),
                ),
                const SizedBox(
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
                const SizedBox(height: 20),
                FormBuilderTextField(
                  minLines:
                      2, // any number you need (It works as the rows for the textarea)
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  // validator: [FormBuilderValidators.email()],
                  decoration: const InputDecoration(
                    labelText: 'Remarks',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: kiconsColor, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: kiconsColor, width: 2),
                    ),
                  ),
                  name: 'Remarks',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      // Form is valid; you can process the data here.
                      print(_formKey.currentState!.value);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kiconsColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the desired border radius
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                          text: 'Send',
                          textcolor: Colors.white,
                          fontsize: 18,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
