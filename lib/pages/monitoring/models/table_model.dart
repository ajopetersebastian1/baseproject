import 'package:baseproject/pages/monitoring/models/chart_data_model.dart';

class MonitoringTableModel {
  final String schemeName;
  final int approved;
  final int declined;
  final int reversal;
  final double percentage;

  MonitoringTableModel(
      {required this.schemeName,
      required this.approved,
      required this.declined,
      required this.reversal,
      required this.percentage});
}
