import 'package:baseproject/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SwitchMonitoring extends StatefulWidget {
  const SwitchMonitoring({super.key});

  @override
  State<SwitchMonitoring> createState() => _SwitchMonitoringState();
}

class _SwitchMonitoringState extends State<SwitchMonitoring> {
  @override
  Widget build(BuildContext context) {
    var list = [
      PiChrItem(color: Colors.red, value: 20),
      PiChrItem(color: Colors.blueAccent, value: 60),
      PiChrItem(color: Colors.teal, value: 60),
    ];
    var headers = ["2hrs", "Approved", "Decline", "Reversal", "%"];
    var headereTwo = ["Overall", "Approved", "Decline", "Reversal", "%"];
    var rows = [
      ["Visa", "240", "5", "3", "2"],
      ["Master", "310", "9", "6", "3"]
    ];
    var rowsTwo = [
      ["Visa", "2400", "50", "30", "2"],
      ["Master", "3100", "90", "60", "3"]
    ];
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Row(
                children: [
                  Image.asset(
                    Assets.images.alliance.path,
                    height: 70,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: ListView(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'System Status',
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: screenWidth / 2,
                    child: PieChart(
                      swapAnimationDuration: const Duration(milliseconds: 750),
                      swapAnimationCurve: Curves.easeInOutQuint,
                      PieChartData(
                        sections: list,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Add some space before the row
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconTextRow(
                        iconData: Icons.rectangle_rounded,
                        iconColor: Colors.red,
                        text: 'Memory',
                      ),
                      SizedBox(width: 15),
                      IconTextRow(
                        iconData: Icons.rectangle_rounded,
                        iconColor: Colors.blueAccent,
                        text: 'CPU',
                      ),
                      SizedBox(width: 15),
                      IconTextRow(
                        iconData: Icons.rectangle_rounded,
                        iconColor: Colors.teal,
                        text: 'Storage',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            Assets.images.visa.path,
                            height: 100,
                          ),
                          Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                color: Colors.blue),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            Assets.images.mastercard.path,
                            height: 100,
                          ),
                          Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  commonTable(headers, rows),
                  const SizedBox(height: 20),
                  commonTable(headereTwo, rowsTwo),
                  Image.asset(
                    Assets.images.adib.path,
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding commonTable(List<String> headers, List<List<String>> rows) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(4),
          2: FlexColumnWidth(4),
          3: FlexColumnWidth(4),
          4: FlexColumnWidth(2),
        },
        border: TableBorder.all(color: Colors.grey),
        children: [
          // First Row (Headers)
          TableRow(
            decoration: const BoxDecoration(color: Colors.black),
            children: headers
                .map((header) => _buildTableCell(
                      header,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ))
                .toList(),
          ),
          // Data Rows
          ...rows.map((row) {
            return TableRow(
              children: row.map((cell) => _buildTableCell(cell)).toList(),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildTableCell(String text,
          {fontWeight = FontWeight.normal, Color color = Colors.black}) =>
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(fontWeight: fontWeight, color: color),
          ),
        ),
      );

  PieChartSectionData PiChrItem({double? value, Color? color}) {
    return PieChartSectionData(
      value: value,
      color: color,
    );
  }
}

class IconTextRow extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String text;

  const IconTextRow({
    Key? key,
    required this.iconData,
    required this.iconColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, color: iconColor),
        const SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}
