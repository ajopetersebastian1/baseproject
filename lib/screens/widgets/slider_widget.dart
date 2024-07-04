import 'package:flutter/material.dart';
import 'package:baseproject/colors.dart';
import 'package:baseproject/widgets/bg_container.dart';

import '../../widgets/custom_text_widget.dart';

class SliderWidget extends StatefulWidget {
  final String title;
  final int value;
  final int minvValue;
  final int maxValue;
  const SliderWidget(
      {super.key,
      required this.value,
      required this.minvValue,
      required this.maxValue,
      required this.title});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late int _slideValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _slideValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return BgContainer(
      backgroundColor: kbgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(text: widget.title, fontsize: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(text: "Current Limit : ${widget.value}"),
              CustomTextWidget(text: "New Limit : $_slideValue"),
            ],
          ),
          Slider(
            onChanged: (t) {
              setState(() {
                _slideValue = t.toInt();
              });
            },
            value: _slideValue.toDouble(),
            min: widget.minvValue.toDouble(),
            label: "$_slideValue",
            max: widget.maxValue.toDouble(),
            divisions: widget.maxValue,
            inactiveColor: Colors.grey,
            activeColor: Colors.red,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(text: widget.minvValue.toString()),
              CustomTextWidget(text: widget.maxValue.toString()),
            ],
          )
        ],
      ),
    );
  }
}
