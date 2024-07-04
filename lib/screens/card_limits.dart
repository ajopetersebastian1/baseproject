import 'package:flutter/material.dart';
import 'package:baseproject/screens/widgets/app_custom_button.dart';
import 'package:baseproject/screens/widgets/slider_widget.dart';
import 'package:baseproject/widgets/app_scaffold.dart';
import 'package:baseproject/widgets/custom_text_widget.dart';

class ViewCardLimits extends StatefulWidget {
  const ViewCardLimits({super.key});

  @override
  State<ViewCardLimits> createState() => _ViewCardLimitsState();
}

class _ViewCardLimitsState extends State<ViewCardLimits> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: AppScaffold(
        title: 'OMA Pay Wallet',
        child: Column(
          children: [
            TabBar(
              tabs: [
                CustomTextWidget(
                  text: 'Domestic',
                  fontsize: 22,
                ),
                CustomTextWidget(
                  text: 'International',
                  fontsize: 22,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      SliderWidget(
                        maxValue: 20000,
                        minvValue: 1000,
                        title: 'ATM',
                        value: 5000,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SliderWidget(
                        maxValue: 20000,
                        minvValue: 1000,
                        title: 'Pos',
                        value: 1200,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SliderWidget(
                        maxValue: 20000,
                        minvValue: 1000,
                        title: 'E-com',
                        value: 1200,
                      ),
                      AppCustomButton(
                        buttonText: 'Update Limits',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SliderWidget(
                        maxValue: 20000,
                        minvValue: 1000,
                        title: 'ATM',
                        value: 5000,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SliderWidget(
                        maxValue: 20000,
                        minvValue: 1000,
                        title: 'Pos',
                        value: 1200,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SliderWidget(
                        maxValue: 20000,
                        minvValue: 1000,
                        title: 'E-com',
                        value: 1200,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      AppCustomButton(
                        buttonText: 'Update Limits',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
