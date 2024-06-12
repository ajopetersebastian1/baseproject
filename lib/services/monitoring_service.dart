import 'package:baseproject/config/endpoints.dart';
import 'package:baseproject/services/connection.dart';

class MonitoringService {
  getDashboardData(requestModel) async {
    Connection connection = Connection();
    var url = EndPoints.baseSwitchMonitoring + EndPoints.dashBoardData;
    print(url);
    var response = await connection.post(url, requestModel);
    return response;
  }
}
