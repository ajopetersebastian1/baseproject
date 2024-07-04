import 'package:flutter/material.dart';
import 'package:baseproject/horizontal_coupon_example_2.dart';
import 'package:baseproject/widgets/app_scaffold.dart';
import 'package:baseproject/widgets/bg_container.dart';

import '../models/giftcards.dart';

class GiftVouchers extends StatelessWidget {
  const GiftVouchers({super.key});

  @override
  Widget build(BuildContext context) {
    List<GiftvouchersModel> demoVoucherList = [
      GiftvouchersModel(
          brandname: 'Apple',
          url: 'https://www.apple.com',
          discountRate: 20,
          imagepath: 'assets/brandIcons/apple.png',
          voucherCode: 'OMAY2VUeXBlXCI6XCJXRUJ'),
      GiftvouchersModel(
          brandname: 'Zara',
          url: 'https://www.zara.com/in/',
          discountRate: 20,
          imagepath: 'assets/brandIcons/zara.png',
          voucherCode: 'OMAY2VUeXBlXCI6XCJXRUJ'),
      GiftvouchersModel(
          brandname: 'Kfc',
          discountRate: 20,
          url: 'https://online.kfc.co.in/',
          imagepath: 'assets/brandIcons/kfc.png',
          voucherCode: 'OMAY2VUeXBlXCI6XCJXRUJ'),
      GiftvouchersModel(
          brandname: "McDonald's",
          discountRate: 20,
          url: 'https://www.mcdonaldsindia.com/',
          imagepath: 'assets/brandIcons/mcdonalds.png',
          voucherCode: 'OMAY2VUeXBlXCI6XCJXRUJ'),
      GiftvouchersModel(
          brandname: 'H & M',
          discountRate: 20,
          url: 'https://www2.hm.com/en_in/index.html',
          imagepath: 'assets/brandIcons/h_and_m.png',
          voucherCode: 'OMAY2VUeXBlXCI6XCJXRUJ'),
    ];
    return AppScaffold(
      title: 'Coupons',
      child: ListView.builder(
        itemBuilder: (context, index) {
          return BgContainer(
            child: HorizontalCouponExample2(
              gifdata: demoVoucherList[index],
            ),
          );
        },
        itemCount: demoVoucherList.length,
      ),
    );
  }
}
