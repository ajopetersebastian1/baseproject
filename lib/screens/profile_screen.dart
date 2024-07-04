import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baseproject/widgets/app_scaffold.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import 'home_screen.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController emailController =
      TextEditingController(text: 'Abcd@gmail.com');
  TextEditingController contactNumberController =
      TextEditingController(text: 'Abcd@gmail.com');
  TextEditingController addressController =
      TextEditingController(text: 'KM Trade ,Rolla');
  TextEditingController stateController = TextEditingController(text: 'Dubai');
  TextEditingController countryController =
      TextEditingController(text: 'UnitedArabEmirates');

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Profile",
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 80,
              child: Image.asset('assets/images/userdemo.png'),
            ),
            buildTextField('Email', emailController),
            buildTextField('Contact Number', contactNumberController),
            buildTextField('Address', addressController),
            buildTextField('State', stateController),
            buildTextField('Country', countryController),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  text: 'Profile updte Success',
                  autoCloseDuration: const Duration(seconds: 2),
                  showConfirmBtn: false,
                );
                Future.delayed(Duration(seconds: 2)).then((value) {
                  Navigator.push<void>(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) => const HomeScreen(),
                    ),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Update Profile'),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(label),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter $label',
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              hintStyle: TextStyle(color: Theme.of(context).primaryColor),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor.withOpacity(0.5)),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
