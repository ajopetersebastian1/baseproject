import 'dart:convert';

import 'package:baseproject/services/monitoring_service.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import '../pages/monitoring/models/chart_data_model.dart';
import '../pages/monitoring/models/table_model.dart';

class DataMonitoringProvider with ChangeNotifier {
  var headers = ["Schemes", "Approved", "Decline", "Reversal", "%"];
  var headereTwo = ["Overall", "Approved", "Decline", "Reversal", "%"];
  MonitoringService monitoringService = MonitoringService();
  List currentWeekData = [];
  var currentMonthData;
  var todayData;
  var requestModel = {
    "appProductId": "6",
    "instId": "ADIBOMA0001",
    "processDate": "2024-06-06",
    "apiType": "3"
  };
  dynamic response;
  List<MonitoringTableModel> uiData = [];
  List<ChartDataModel> chartDataModel = [
    ChartDataModel(
      color: Colors.cyan,
      title: "System",
    ),
    ChartDataModel(
      color: Colors.green,
      title: "Cpu",
    ),
    ChartDataModel(
      color: Colors.lightBlue,
      title: "Memory",
    ),
  ];

  final List<MonitoringTableModel> _twoHours = [
    MonitoringTableModel(
        schemeName: "Visa",
        approved: 240,
        declined: 5,
        reversal: 3,
        percentage: 2.0),
    MonitoringTableModel(
        schemeName: "Master",
        approved: 310,
        declined: 9,
        reversal: 6,
        percentage: 3.0),
  ];

  final List<MonitoringTableModel> _today = [
    MonitoringTableModel(
        schemeName: "Visa",
        approved: 2400,
        declined: 50,
        reversal: 30,
        percentage: 2.0),
    MonitoringTableModel(
        schemeName: "Master",
        approved: 3100,
        declined: 90,
        reversal: 60,
        percentage: 3.0),
    MonitoringTableModel(
        schemeName: "Master",
        approved: 310,
        declined: 9,
        reversal: 6,
        percentage: 3.0),
  ];

  final List<MonitoringTableModel> _week = [
    MonitoringTableModel(
        schemeName: "Visa",
        approved: 24523,
        declined: 4234,
        reversal: 23,
        percentage: 2.0),
  ];

  final List<MonitoringTableModel> _month = [
    MonitoringTableModel(
        schemeName: "Visa",
        approved: 87676,
        declined: 434,
        reversal: 34,
        percentage: 23.0),
    MonitoringTableModel(
        schemeName: "Master",
        approved: 42423,
        declined: 34,
        reversal: 60,
        percentage: 33.0),
  ];

  final List<MonitoringTableModel> _custom = [
    MonitoringTableModel(
        schemeName: "Visa",
        approved: 5254,
        declined: 324,
        reversal: 234,
        percentage: 52.0),
    MonitoringTableModel(
        schemeName: "Master",
        approved: 3242,
        declined: 234,
        reversal: 334,
        percentage: 43.0),
  ];
  getDashboardData() async {
    int month = DateTime.now().month;
    print("month $month");
    await monitoringService
        .getDashboardData(requestModel)
        .then((response) async {
      final Map<String, dynamic> data = json.decode(response.body);
      currentWeekData = data['data'][0]['weeklyTxnCount'];
      todayData = data['data'][0]['todayTxnWiseCount'][0];
      currentMonthData = data['data'][0]['monthlyTxnCount'][month - 1];
      for (var items in currentWeekData) {
        print(items);
      }
    });
    setDefaultValues();
    notifyListeners();
  }

  setDefaultValues() {
    uiData = [
      MonitoringTableModel(
          schemeName: "visa",
          approved: todayData["visaApprovedCount"],
          declined: todayData["visaApprovedCount"],
          reversal: todayData["visaApprovedCount"],
          percentage: todayData["visaApprovedCount"].toDouble()),
      MonitoringTableModel(
          schemeName: "Master",
          approved: todayData["visaApprovedCount"],
          declined: todayData["visaApprovedCount"],
          reversal: todayData["visaApprovedCount"],
          percentage: todayData["visaApprovedCount"].toDouble()),
    ];

    // for (var items in todayData) {
    //   uiData = [
    //     MonitoringTableModel(
    //         schemeName: "visa",
    //         approved: items["visaApprovedCount"],
    //         declined: items["visaApprovedCount"],
    //         reversal: items["visaApprovedCount"],
    //         percentage: items["visaApprovedCount"].toDouble())
    //   ];
    // }
    // uiData = uiData = _twoHours;
    notifyListeners();
  }

  void changeMonitoringInfo({required int tabIndex}) {
    print("Tab index$tabIndex");
    if (tabIndex == 0) {
      setDefaultValues();
    } else if (tabIndex == 1) {
      num visaApprovedCount = 0;
      num visaDeclineCount = 0;
      num visaReversalCount = 0;
      num masterApprovedCount = 0;
      num masterDeclineCount = 0;
      num masterReversalCount = 0;

      for (var item in currentWeekData) {
        visaApprovedCount += item["visaApprovedCount"];
        visaDeclineCount += item["visaDeclinedCount"];
        visaReversalCount += item["visaApprovedCountRefund"];
        masterApprovedCount += item["mcrdApprovedCount"];
        masterDeclineCount += item["mcrdDeclinedCount"];
        masterReversalCount += item["mcrdApprovedCountRefund"];
        // print(item);
      }
      uiData = [
        MonitoringTableModel(
            schemeName: "visa",
            approved: visaApprovedCount.toInt(),
            declined: visaDeclineCount.toInt(),
            reversal: visaReversalCount.toInt(),
            percentage: todayData["visaApprovedCount"].toDouble()),
        MonitoringTableModel(
            schemeName: "Master",
            approved: masterApprovedCount.toInt(),
            declined: masterDeclineCount.toInt(),
            reversal: masterReversalCount.toInt(),
            percentage: todayData["visaApprovedCount"].toDouble()),
      ];
    } else if (tabIndex == 2) {
      print(currentMonthData);
      uiData = [
        MonitoringTableModel(
            schemeName: "visa",
            approved: currentMonthData["visaApprovedCount"],
            declined: currentMonthData["visaDeclinedCount"],
            reversal: currentMonthData["visaApprovedCountRefund"],
            percentage: currentMonthData["visaApprovedCount"].toDouble()),
        MonitoringTableModel(
            schemeName: "Master",
            approved: currentMonthData["mcrdApprovedCount"],
            declined: currentMonthData["mcrdDeclinedCount"],
            reversal: currentMonthData["mcrdApprovedCountRefund"],
            percentage: currentMonthData["visaApprovedCount"].toDouble()),
      ];
    }
    // final dataSets = [_twoHours, _today, _week, _month, _custom];
    // uiData = dataSets[tabIndex];

    notifyListeners();
  }
}
