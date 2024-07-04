import 'package:flutter/material.dart';
import 'package:baseproject/colors.dart';
import 'package:baseproject/widgets/custom_text_widget.dart';

class ImageTextIcon extends StatelessWidget {
  final String title;
  final String imgPath;
  final Color iconColor;
  final Color textColor;
  final double iconSize;
  final double fontSize;
  final Color iconBgColor;
  final Function()? onTap;
  final bool diseableIconColor;

  const ImageTextIcon(
      {super.key,
      required this.title,
      required this.imgPath,
      this.iconColor = kiconsColor,
      this.textColor = ktextColor,
      this.iconSize = 50,
      this.fontSize = 14,
      this.iconBgColor = Colors.transparent,
      this.onTap,
      this.diseableIconColor = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: iconBgColor,
                // border: Border.all(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imgPath,
                  height: iconSize,
                  width: iconSize,
                  color: diseableIconColor ? null : iconColor,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextWidget(
              text: title,
              textcolor: textColor,
              fontsize: fontSize,
            ),
          ],
        ),
      ),
    );
  }
}
