import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baseproject/colors.dart';
import 'package:baseproject/widgets/webview.dart';

import 'models/giftcards.dart';

class HorizontalCouponExample2 extends StatelessWidget {
  final GiftvouchersModel gifdata;
  const HorizontalCouponExample2({Key? key, required this.gifdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xfff1e3d3);
    const Color secondaryColor = kiconsColor;

    return CouponCard(
      height: 200,
      backgroundColor: primaryColor,
      clockwise: true,
      curvePosition: 135,
      curveRadius: 30,
      curveAxis: Axis.vertical,
      borderRadius: 10,
      firstChild: Container(
        decoration: const BoxDecoration(
          color: secondaryColor,
        ),
        child: InkWell(
          onTap: () {
            Navigator.push<void>(
              context,
              CupertinoPageRoute<void>(
                builder: (BuildContext context) => CustomWebView(
                  url: gifdata.url,
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${gifdata.brandname}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        gifdata.imagepath,
                        height: 60,
                      ),
                      const Divider(color: Colors.white54, height: 0),
                      Text(
                        '${gifdata.discountRate}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'OFF',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      secondChild: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Coupon Code',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '${gifdata.voucherCode}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              'Valid Till - 30 Jan 2022',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
             ListTile(
              leading: Image.asset(demoVoucherList[index].imagepath),
              title: CustomTextWidget(text: demoVoucherList[index].brandname),
              subtitle: CustomTextWidget(
                text: "Discount : ${demoVoucherList[index].discountRate} %",
                textcolor: Colors.green,
              ),
            ),
            */