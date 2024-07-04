import 'package:flutter/material.dart';

import '../../widgets/custom_text_widget.dart';

class AppCustomButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const AppCustomButton({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          // border: Border.all(),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        height: 40,
        child: Center(
          child: CustomTextWidget(
              text: buttonText,
              fontsize: 20,
              fontWeight: FontWeight.w600,
              textcolor: Colors.white),
        ),
      ),
    );
  }
}
