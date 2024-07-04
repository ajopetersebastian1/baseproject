import 'package:flutter/material.dart';
import 'package:baseproject/widgets/app_scaffold.dart';
import 'package:lottie/lottie.dart';
import 'package:baseproject/widgets/bg_container.dart';
import 'package:baseproject/widgets/custom_text_widget.dart';

class Referals extends StatelessWidget {
  const Referals({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'Referals',
        child: Column(
          children: [
            Lottie.asset(
              'assets/lottie/reffer_a_friend.json',

              animate: true, // Auto-play animation
              repeat: true, // Loop animation
            ),
            const BgContainer(
              backgroundColor: Colors.white,
              child: Column(
                children: [
                  CustomTextWidget(
                    text: 'Refer A friend',
                    fontWeight: FontWeight.w700,
                    fontsize: 24,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'XHFJGKFUJ5776',
                        //hintStyle:
                        suffixIcon: Icon(Icons.share)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextWidget(
                    text:
                        '''Invite your friends, family, and colleagues to join the Oma Pay family. you'll receive fantastic rewards for every successful referral. Start sharing and start earning today!''',
                    fontWeight: FontWeight.w700,
                    fontsize: 16,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
