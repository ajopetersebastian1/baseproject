import 'package:flutter/material.dart';
import 'package:baseproject/colors.dart';

class BgContainer extends StatelessWidget {
  final Color backgroundColor;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  const BgContainer(
      {super.key,
      this.child,
      this.padding =
          const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 20),
      this.backgroundColor = ktileColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: backgroundColor,
        // border: Border.all(),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
