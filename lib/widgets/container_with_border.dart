import 'package:flutter/material.dart';
import 'package:baseproject/colors.dart';

class MyClickableContainer extends StatelessWidget {
  final String amount;
  final Function()? onTap;
  const MyClickableContainer({super.key, required this.amount, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.0,
        height: 45.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kiconsColor, width: 2.0),
        ),
        child: Center(
          child: Text(
            amount,
            style: const TextStyle(
              color: kiconsColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
