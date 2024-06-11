import 'package:baseproject/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class SwitchMonitoring extends StatefulWidget {
  const SwitchMonitoring({super.key});

  @override
  State<SwitchMonitoring> createState() => _SwitchMonitoringState();
}

class _SwitchMonitoringState extends State<SwitchMonitoring>
    with SingleTickerProviderStateMixin {
  late DataMonitoringProvider dataMonitoringProvider;
  bool isDarkMode = false;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dataMonitoringProvider =
          Provider.of<DataMonitoringProvider>(context, listen: false);
      dataMonitoringProvider.setDefaultValues();
    });
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // dataMonitoringProvider =
    //     Provider.of<DataMonitoringProvider>(context, listen: false);
    var list = [
      PiChrItem(color: Colors.red, value: 20),
      PiChrItem(color: Colors.blueAccent, value: 60),
      PiChrItem(color: Colors.teal, value: 60),
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 5),
          child: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                icon: Icon(Icons.timelapse_outlined),
                text: "2 hrs",
              ),
              Tab(
                icon: Icon(Icons.sunny),
                text: "Today",
              ),
              Tab(
                icon: Icon(Icons.view_week_outlined),
                text: "Week",
              ),
              Tab(
                icon: Icon(Icons.calendar_month),
                text: "Month",
              ),
              Tab(
                icon: Icon(Icons.local_convenience_store_outlined),
                text: "Custom",
              ),
            ],
            onTap: (value) {
              dataMonitoringProvider.changeMonitoringInfo(tabIndex: value);
            },
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
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
                  commonTable(),
                  const SizedBox(height: 20),
                  // commonTable(headereTwo, rowsTwo),
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

  Padding commonTable() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Consumer<DataMonitoringProvider>(
          builder: (context, dataProvider, child) {
        return Table(
          columnWidths: const {
            0: FlexColumnWidth(4),
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
              children: dataProvider.headers
                  .map((header) => _buildTableCell(header,
                      fontWeight: FontWeight.bold, color: Colors.white))
                  .toList(),
            ),
            // Data Rows

            ...dataProvider.uiData.map((data) {
              return TableRow(
                children: [
                  _buildTableCell(data.schemeName),
                  _buildTableCell(data.approved),
                  _buildTableCell(data.declined),
                  _buildTableCell(data.reversal),
                  _buildTableCell(data.percentage)
                ],
              );
            }).toList(),
          ],
        );
      }),
    );
  }

  Widget _buildTableCell(dynamic text,
          {fontWeight = FontWeight.normal, Color? color}) =>
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text.toString(),
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
