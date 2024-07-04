import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:baseproject/widgets/bg_container.dart';

import '../widgets/app_scaffold.dart';

import 'dart:math' as math;

import 'package:awesome_card/awesome_card.dart';

class LinkCard extends StatefulWidget {
  const LinkCard({
    super.key,
  });

  @override
  _LinkCardState createState() => _LinkCardState();
}

class _LinkCardState extends State<LinkCard> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  TextEditingController textEditingController =
      TextEditingController(text: '1000');

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Link Card',
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
                    MyHomePage(
                      title: 'fgdfg',
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          // Form is valid; you can process the data here.
                          print(_formKey.currentState!.value);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Link Card'),
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  bool showBack = false;

  late FocusNode _focusNode;
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        CreditCard(
          width: 420,
          cardType: CardType.visa,
          cardNumber: cardNumber,
          cardExpiry: expiryDate,
          cardHolderName: cardHolderName,
          cvv: cvv,
          bankName: 'OMA',
          showBackSide: showBack,
          frontBackground: CardBackgrounds.black,
          backBackground: CardBackgrounds.white,
          showShadow: true,
          //isContactless: true,
          // mask: getCardTypeMask(cardType: CardType.americanExpress),
        ),
        SizedBox(
          height: 40,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextFormField(
                controller: cardNumberCtrl,
                decoration: InputDecoration(hintText: 'Card Number'),
                maxLength: 16,
                onChanged: (value) {
                  final newCardNumber = value.trim();
                  var newStr = '';
                  final step = 4;

                  for (var i = 0; i < newCardNumber.length; i += step) {
                    newStr += newCardNumber.substring(
                        i, math.min(i + step, newCardNumber.length));
                    if (i + step < newCardNumber.length) newStr += ' ';
                  }

                  setState(() {
                    cardNumber = newStr;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextFormField(
                controller: expiryFieldCtrl,
                decoration: InputDecoration(hintText: 'Card Expiry'),
                maxLength: 5,
                onChanged: (value) {
                  var newDateValue = value.trim();
                  final isPressingBackspace =
                      expiryDate.length > newDateValue.length;
                  final containsSlash = newDateValue.contains('/');

                  if (newDateValue.length >= 2 &&
                      !containsSlash &&
                      !isPressingBackspace) {
                    newDateValue = newDateValue.substring(0, 2) +
                        '/' +
                        newDateValue.substring(2);
                  }
                  setState(() {
                    expiryFieldCtrl.text = newDateValue;
                    expiryFieldCtrl.selection = TextSelection.fromPosition(
                        TextPosition(offset: newDateValue.length));
                    expiryDate = newDateValue;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Card Holder Name'),
                onChanged: (value) {
                  setState(() {
                    cardHolderName = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'CVV'),
                maxLength: 3,
                onChanged: (value) {
                  setState(() {
                    cvv = value;
                  });
                },
                focusNode: _focusNode,
              ),
            ),
          ],
        )
      ],
    );
  }
}
