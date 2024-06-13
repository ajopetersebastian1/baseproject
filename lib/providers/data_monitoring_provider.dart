import 'dart:convert';
import 'package:baseproject/services/monitoring_service.dart';
import 'package:flutter/material.dart';
import '../pages/monitoring/models/chart_data_model.dart';
import '../pages/monitoring/models/table_model.dart';

class DataMonitoringProvider with ChangeNotifier {
  final List<String> headers = [
    "Schemes",
    "Approved",
    "Decline",
    "Reversal",
    "%"
  ];
  final List<String> headereTwo = [
    "Overall",
    "Approved",
    "Decline",
    "Reversal",
    "%"
  ];
  final MonitoringService monitoringService = MonitoringService();

  List<dynamic> currentWeekData = [];
  Map<String, dynamic>? currentMonthData;
  Map<String, dynamic>? todayData;
  final Map<String, String> requestModel = {
    "appProductId": "6",
    "instId": "ADIBOMA0001",
    "processDate": "2024-06-06",
    "apiType": "3"
  };
  List<MonitoringTableModel> uiData = [];
  final List<ChartDataModel> chartDataModel = [
    ChartDataModel(color: Colors.cyan, title: "System"),
    ChartDataModel(color: Colors.green, title: "Cpu"),
    ChartDataModel(color: Colors.lightBlue, title: "Memory"),
  ];

  Future<void> getDashboardData() async {
    final int month = DateTime.now().month;
    try {
      final response = await monitoringService.getDashboardData(requestModel);
      final Map<String, dynamic> data = json.decode(response.body);
      currentWeekData = data['data'][0]['weeklyTxnCount'];
      todayData = data['data'][0]['todayTxnWiseCount'][0];
      currentMonthData = data['data'][0]['monthlyTxnCount'][month - 1];

      setDefaultValues();
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  void setDefaultValues() {
    if (todayData == null) return;

    uiData = [
      MonitoringTableModel(
        schemeName: "Visa",
        approved: todayData!["visaApprovedCount"] ?? 0,
        declined: todayData!["visaDeclinedCount"] ?? 0,
        reversal: todayData!["visaReversalCount"] ?? 0,
        percentage: (todayData!["visaApprovedCount"] ?? 0).toDouble(),
      ),
      MonitoringTableModel(
        schemeName: "Master",
        approved: todayData!["mcrdApprovedCount"] ?? 0,
        declined: todayData!["mcrdDeclinedCount"] ?? 0,
        reversal: todayData!["mcrdReversalCount"] ?? 0,
        percentage: (todayData!["mcrdApprovedCount"] ?? 0).toDouble(),
      ),
    ];

    notifyListeners();
  }

  void changeMonitoringInfo({required int tabIndex}) {
    switch (tabIndex) {
      case 0:
        setDefaultValues();
        break;
      case 1:
        setWeeklyValues();
        break;
      case 2:
        setMonthlyValues();
        break;
    }
  }

  void setWeeklyValues() {
    num visaApprovedCount = 0;
    num visaDeclineCount = 0;
    num visaReversalCount = 0;
    num masterApprovedCount = 0;
    num masterDeclineCount = 0;
    num masterReversalCount = 0;

    for (var item in currentWeekData) {
      visaApprovedCount += item["visaApprovedCount"] ?? 0;
      visaDeclineCount += item["visaDeclinedCount"] ?? 0;
      visaReversalCount += item["visaApprovedCountRefund"] ?? 0;
      masterApprovedCount += item["mcrdApprovedCount"] ?? 0;
      masterDeclineCount += item["mcrdDeclinedCount"] ?? 0;
      masterReversalCount += item["mcrdApprovedCountRefund"] ?? 0;
    }

    uiData = [
      MonitoringTableModel(
        schemeName: "Visa",
        approved: visaApprovedCount.toInt(),
        declined: visaDeclineCount.toInt(),
        reversal: visaReversalCount.toInt(),
        percentage: visaApprovedCount.toDouble(),
      ),
      MonitoringTableModel(
        schemeName: "Master",
        approved: masterApprovedCount.toInt(),
        declined: masterDeclineCount.toInt(),
        reversal: masterReversalCount.toInt(),
        percentage: masterApprovedCount.toDouble(),
      ),
    ];

    notifyListeners();
  }

  void setMonthlyValues() {
    if (currentMonthData == null) return;

    uiData = [
      MonitoringTableModel(
        schemeName: "Visa",
        approved: currentMonthData!["visaApprovedCount"] ?? 0,
        declined: currentMonthData!["visaDeclinedCount"] ?? 0,
        reversal: currentMonthData!["visaApprovedCountRefund"] ?? 0,
        percentage: (currentMonthData!["visaApprovedCount"] ?? 0).toDouble(),
      ),
      MonitoringTableModel(
        schemeName: "Master",
        approved: currentMonthData!["mcrdApprovedCount"] ?? 0,
        declined: currentMonthData!["mcrdDeclinedCount"] ?? 0,
        reversal: currentMonthData!["mcrdApprovedCountRefund"] ?? 0,
        percentage: (currentMonthData!["visaApprovedCount"] ?? 0).toDouble(),
      ),
    ];

    notifyListeners();
  }
}
