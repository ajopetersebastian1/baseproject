import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baseproject/screens/billpayments/electricity_billpay.dart';
import 'package:baseproject/screens/billpayments/mobilere_charge.dart';
import 'package:baseproject/screens/billpayments/water_billpay.dart';
import 'package:baseproject/colors.dart';
import 'package:baseproject/screens/add_money_to_wallet.dart';
import 'package:baseproject/screens/refferals.dart';
import 'package:baseproject/widgets/bg_container.dart';
import 'package:baseproject/widgets/webview.dart';
import 'billpayments/rent_pay.dart';
import 'money_tranfer.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/custom_text_widget.dart';
import '../widgets/image_text_icon.dart';
import 'gift_vouchers.dart';
import 'link_bank.dart';
import 'link_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController =
      TextEditingController(text: '1000');
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        eneableScanner: true,
        title: 'Oma pay',
        child: ListView(
          children: [
            _financialOperations(),
            const SizedBox(
              height: 10,
            ),
            _walletRewardRefer(),
            const SizedBox(
              height: 10,
            ),
            _rechargeAndBills(),
            const SizedBox(
              height: 10,
            ),
            brandDiscounds(context),
            const SizedBox(
              height: 10,
            ),
            travel(context),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  BgContainer brandDiscounds(BuildContext context) {
    return BgContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text: 'CO Brands',
            fontsize: 18,
            fontWeight: FontWeight.w600,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ImageTextIcon(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) => const CustomWebView(
                          url: 'https://www.apple.com',
                        ),
                      ),
                    );
                  },
                  imgPath: 'assets/brandIcons/apple.png',
                  title: 'Apple',
                  iconColor: Colors.black,
                  iconBgColor: Colors.white,
                ),
                ImageTextIcon(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) => const CustomWebView(
                          url: 'https://www.zara.com/in/',
                        ),
                      ),
                    );
                  },
                  imgPath: 'assets/brandIcons/zara.png',
                  title: 'Zara',
                  iconColor: Colors.black,
                  iconBgColor: Colors.white,
                ),
                ImageTextIcon(
                  imgPath: 'assets/brandIcons/mcdonalds.png',
                  title: "McDonald's",
                  iconColor: Colors.yellow,
                  iconBgColor: Colors.red,
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) => const CustomWebView(
                          url: 'https://www.mcdonaldsindia.com/',
                        ),
                      ),
                    );
                  },
                ),
                ImageTextIcon(
                  imgPath: 'assets/brandIcons/h_and_m.png',
                  title: 'H & M',
                  iconColor: Colors.red.shade800,
                  iconBgColor: Colors.white,
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) => const CustomWebView(
                          url: 'https://www2.hm.com/en_in/index.html',
                        ),
                      ),
                    );
                  },
                ),
                ImageTextIcon(
                  imgPath: 'assets/brandIcons/kfc.png',
                  title: 'KFC',
                  diseableIconColor: true,
                  iconBgColor: Colors.red.shade900,
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) => const CustomWebView(
                          url: 'https://online.kfc.co.in/',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  BgContainer travel(BuildContext context) {
    return BgContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text: 'travel',
            fontsize: 18,
            fontWeight: FontWeight.w600,
          ),
          Row(
            children: [
              ImageTextIcon(
                imgPath: 'assets/images/coupon.png',
                title: 'Coupons',
                onTap: () {
                  Navigator.push<void>(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) => const GiftVouchers(),
                    ),
                  );
                },
              ),
              const ImageTextIcon(
                imgPath: 'assets/images/bill_payment.png',
                title: 'Bill \npayment',
              ),
              const ImageTextIcon(
                imgPath: 'assets/images/gift.png',
                title: 'gifts',
              ),
              const ImageTextIcon(
                imgPath: 'assets/images/link_bank.png',
                title: 'Link \nBank',
              ),
            ],
          )
        ],
      ),
    );
  }

  BgContainer _rechargeAndBills() {
    return BgContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text: 'Recharge & Bills',
            fontsize: 18,
            fontWeight: FontWeight.w600,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageTextIcon(
                    imgPath: 'assets/utils_icon/phone_recharge.png',
                    title: 'Mobile\nRecharge',
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) => const MobileBill(),
                        ),
                      );
                    },
                  ),
                  ImageTextIcon(
                    imgPath: 'assets/utils_icon/water_bill.png',
                    title: 'Watter\nbill',
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) =>
                              const WaterBillPay(),
                        ),
                      );
                    },
                  ),
                  const ImageTextIcon(
                    imgPath: 'assets/utils_icon/loan_repayment.png',
                    title: 'Loan\nRepayment',
                  ),
                  ImageTextIcon(
                    imgPath: 'assets/utils_icon/electricity.png',
                    title: 'Electricity',
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ElectriccityBillPay(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageTextIcon(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) =>
                              const RentPayment(),
                        ),
                      );
                    },
                    imgPath: 'assets/utils_icon/home_rent.png',
                    title: 'Rent\nPayment',
                  ),
                  ImageTextIcon(
                    imgPath: 'assets/utils_icon/education_fee.png',
                    title: 'Education\nfee',
                  ),
                  ImageTextIcon(
                    imgPath: 'assets/images/gift.png',
                    title: 'Gifts',
                  ),
                  ImageTextIcon(
                    iconColor: Colors.white,
                    iconSize: 30,
                    iconBgColor: kiconsColor,
                    imgPath: 'assets/images/view_more.png',
                    title: 'More',
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Row _walletRewardRefer() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: kiconsColor,
              // border: Border.all(),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: ImageTextIcon(
              onTap: () {
                Navigator.push<void>(
                  context,
                  CupertinoPageRoute<void>(
                    builder: (BuildContext context) => const AddMoneyToWallet(),
                  ),
                );
              },
              textColor: Colors.white,
              iconColor: Colors.white,
              imgPath: 'assets/images/wallet.png',
              title: 'wallet',
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: kiconsColor,
              // border: Border.all(),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: const ImageTextIcon(
              textColor: Colors.white,
              iconColor: Colors.white,
              imgPath: 'assets/images/gift.png',
              title: 'Rewards',
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: kiconsColor,
              // border: Border.all(),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: ImageTextIcon(
              onTap: () {
                Navigator.push<void>(
                  context,
                  CupertinoPageRoute<void>(
                    builder: (BuildContext context) => const Referals(),
                  ),
                );
              },
              textColor: Colors.white,
              iconColor: Colors.white,
              imgPath: 'assets/images/refer.png',
              title: 'Refer',
            ),
          ),
        ),
      ],
    );
  }

  BgContainer _financialOperations() {
    return BgContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text: 'Financial Operations',
            fontsize: 18,
            fontWeight: FontWeight.w600,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageTextIcon(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) => const MoneyTranfer(),
                    ),
                  );
                },
                iconBgColor: kiconsColor,
                iconColor: ktextColor,
                imgPath: 'assets/images/money.png',
                title: 'Money \nTransfer',
              ),
              ImageTextIcon(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) =>
                          const AddMoneyToWallet(),
                    ),
                  );
                },
                iconBgColor: kiconsColor,
                iconColor: ktextColor,
                imgPath: 'assets/images/wallet.png',
                title: 'wallets',
              ),
              ImageTextIcon(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) => const LinkBank(),
                    ),
                  );
                },
                iconBgColor: kiconsColor,
                iconColor: ktextColor,
                imgPath: 'assets/images/link_bank.png',
                title: 'Link \nBank',
              ),
              ImageTextIcon(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) => const LinkCard(),
                    ),
                  );
                },
                iconBgColor: kiconsColor,
                iconColor: ktextColor,
                imgPath: 'assets/images/link_card.png',
                title: 'Link \nCard',
              ),
            ],
          )
        ],
      ),
    );
  }
}
