import 'package:baseproject/services/monitoring_service.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import '../pages/monitoring/models/chart_data_model.dart';
import '../pages/monitoring/models/table_model.dart';

class DataMonitoringProvider with ChangeNotifier {
  var headers = ["Schemes", "Approved", "Decline", "Reversal", "%"];
  var headereTwo = ["Overall", "Approved", "Decline", "Reversal", "%"];
  MonitoringService monitoringService = MonitoringService();
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
    response = await monitoringService.getDashboardData(requestModel);
  }

  setDefaultValues() {
    uiData = _twoHours;
    notifyListeners();
  }

  void changeMonitoringInfo({required int tabIndex}) {
    final dataSets = [_twoHours, _today, _week, _month, _custom];
    uiData = dataSets[tabIndex];

    print(tabIndex);
    notifyListeners();
  }
}
