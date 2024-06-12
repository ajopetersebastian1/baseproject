class LoginRequestModel {
  String? userName;

  String? password;
  String? deviceType;

  LoginRequestModel({
    this.userName,
    this.password,
    this.deviceType,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //  data['instId'] = instId;
    data['userName'] = userName;
    // data['pin'] = pin;
    data['password'] = password;
    data['deviceType'] = deviceType;
    // data['deviceId'] = deviceId;
    // data['email'] = email;
    return data;
  }
}
