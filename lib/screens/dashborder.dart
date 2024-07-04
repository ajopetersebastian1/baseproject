import 'package:flutter/material.dart';

class DottedBorderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        child: CustomPaint(
          painter: DottedBorderPainter(),
        ),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final Path path = Path();
    final double dashWidth = 5;
    final double dashSpace = 5;
    double currentX = 0;

    while (currentX < size.width) {
      path.moveTo(currentX, 0);
      path.lineTo(currentX + dashWidth, 0);
      currentX += dashWidth + dashSpace;
    }
    currentX = 0;

    while (currentX < size.height) {
      path.moveTo(size.width, currentX);
      path.lineTo(size.width, currentX + dashWidth);
      currentX += dashWidth + dashSpace;
    }

    currentX = 0;
    while (currentX < size.height) {
      path.moveTo(0, currentX);
      path.lineTo(0, currentX + dashWidth);
      currentX += dashWidth + dashSpace;
    }
    currentX = 0;
    while (currentX < size.width) {
      path.moveTo(size.height, currentX);
      path.lineTo(currentX + dashWidth, size.width);
      currentX += dashWidth + dashSpace;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
