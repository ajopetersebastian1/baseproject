import '../config/endpoints.dart';
import 'connection.dart';

class UserServices {
  late String token;
  dynamic user;

  loginService(requestModel) async {
    Connection connection = Connection();
    var url = EndPoints.baseLogin + EndPoints.loginAPI;
    print(url);
    var response = await connection.postWithOutToken(url, requestModel);
    return response;
  }

  // newCustomerSignup(req, pp, kf, kb) async {
  //   String url = EndPoints.baseApi9502 + EndPoints.registerAPI;
  //   final request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.fields['instId'] = Constants.instId;
  //   request.fields['notificationToken'] = req.notificationToken;
  //   request.fields['deviceId'] = req.deviceId;
  //   request.fields['userName'] = req.userName;
  //   print(request.fields['city']);
  //   print(request.fields['postalCode']);
  //   print(request.fields['kycType']);
  //   print(request.fields['currencyId']);
  //   final k1 = await http.MultipartFile.fromPath('file', kf);
  //   final k2 = await http.MultipartFile.fromPath('file', kb);
  //   if (pp != '') {
  //     final p1 = await http.MultipartFile.fromPath('profilePic', pp);
  //     request.files.add(p1);
  //   }
  //   print(k1);
  //   print(k2);
  //   print(pp);
  //   request.files.add(k1);
  //   request.files.add(k2);
  //   final streamedResponse = await request.send();
  //   final response = await http.Response.fromStream(streamedResponse);
  //   return response;
  // }

  // changePassword(ChangePasswordModel changePasswordModel, String type) async {
  //   String types =
  //       type == 'MPIN' ? EndPoints.changeMpinAPI : EndPoints.changePasswordAPI;
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   user = {
  //     'custId': prefs.get('custId'),
  //     'userName': prefs.get('userName'),
  //     'role': prefs.get('role'),
  //   };
  //   changePasswordModel.instId = Constants.instId;
  //   changePasswordModel.userName = user['userName'];
  //   changePasswordModel.deviceType = Constants.deviceType;
  //   changePasswordModel.role = user['role'];
  //   Connection connection = Connection();
  //   var url = EndPoints.baseApi9502 + types;
  //   var response = await connection.post(url, changePasswordModel);
  //   return response;
  // }
}
