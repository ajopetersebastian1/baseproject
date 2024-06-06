/* ===============================================================
| Project : SIFR
| Page    : CONNECTION.DART
| Date    : 23-MAR-2023
|
*  ===============================================================*/

// Dependencies or Plugins - Models - Services - Global Functions
import 'dart:convert';
import 'dart:io';

import 'package:baseproject/storage/secure_storage.dart';
import 'package:baseproject/widgets/app/alert_service.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../config/constants.dart';
import '../config/static_functions.dart';
import '../main.dart';

class Connection {
  // Header type
  final header = {'Content-Type': 'application/json'};
  static const int timeOutDuration = 35; //Api call time out duration
  AlertService alertService = AlertService();
  BoxStorage boxStorage = BoxStorage();

  Future<SecurityContext> get globalContext async {
    final sslCert1 = await rootBundle.load('assets/ca/certificate.pem');
    SecurityContext sc = SecurityContext(withTrustedRoots: false);
    sc.setTrustedCertificatesBytes(sslCert1.buffer.asInt8List());
    print(sc);
    return sc;
  }

  /*
  * SERVICE NAME: postWithOutToken
  * DESC: Global POST Method Without Token
  * METHOD: POST
  * Params: url and requestData
  */
  postWithOutToken(url, requestData) async {
    print("postWithOutToken");
    print(requestData);
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(requestData), headers: header);
    print(url);
    print(response.body);
    return response;

    // HttpClient client = HttpClient(context: await globalContext);
    // client.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => false;
    // IOClient ioClient = IOClient(client);
    // var response = await ioClient.post(Uri.parse(url),
    //     body: jsonEncode(requestData), headers: header);
    // print(response.body);
    // return response;
  }

  /*
  * SERVICE NAME: getWithOutToken
  * DESC: Global GET Method Without Token
  * METHOD: GET
  * Params: url
  */
  getWithOutToken(url) async {
    print("getWithOutToken");
    print(url);
    var response = await http.get(Uri.parse(url));
    // HttpClient client = HttpClient(context: await globalContext);
    // client.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => false;
    // IOClient ioClient = IOClient(client);
    // var response = await ioClient.get(Uri.parse(url));
    print(response.body);
    return response;
  }

  /*
  * SERVICE NAME: get
  * DESC: Global GET Method With Token
  * METHOD: GET
  * Params: url
  */
  get(String url) async {
    print("get");
    print(url);
    String token = boxStorage.getToken();
    final headers = {
      'Authorization': 'Bearer $token',
      'Bearer': token,
      'Content-Type': 'application/json'
    };

    var res = await http.get(Uri.parse(url), headers: headers);
    print(res.body);
    // HttpClient client = HttpClient(context: await globalContext);
    // client.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => false;
    // IOClient ioClient = IOClient(client);
    // var res = await ioClient.get(Uri.parse(url), headers: headers);

    if (res.statusCode == 401) {
      alertService.error(Constants.unauthorized);
      navigatorKey.currentState?.pushReplacementNamed('login');
      clearStorage();
    } else {
      return res;
    }
  }

  /*
  * SERVICE NAME: post
  * DESC: Global POST Method With Token
  * METHOD: POST
  * Params: url and requestData
  */
  post(url, requestData) async {
    print(post);
    print(url);
    print(jsonEncode(requestData));
    String token = boxStorage.getToken();
    final header = {
      'Authorization': 'Bearer $token',
      'Bearer': token,
      'Content-Type': 'application/json'
    };
    var res = await http.post(Uri.parse(url),
        body: jsonEncode(requestData), headers: header);
    print(res.body);
    // HttpClient client = HttpClient(context: await globalContext);
    // client.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => false;
    // IOClient ioClient = IOClient(client);
    // var res = await ioClient.post(Uri.parse(url),
    //     body: jsonEncode(requestData), headers: header);

    if (res.statusCode == 401) {
      alertService.error(Constants.unauthorized);
      navigatorKey.currentState?.pushReplacementNamed('login');
      clearStorage();
    } else {
      return res;
    }
  }

/*
  * SERVICE NAME: put
  * DESC: Global PUT Method With Token
  * METHOD: PUT
  * Params: url
  */
  put(url) async {
    print(url);
    String token = boxStorage.getToken();
    final header = {
      'Authorization': 'Bearer $token',
      'Bearer': token,
      'Content-Type': 'application/json'
    };
    var res = await http.put(Uri.parse(url), headers: header);
    // HttpClient client = HttpClient(context: await globalContext);
    // client.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => false;
    // IOClient ioClient = IOClient(client);
    // var res = await ioClient.put(Uri.parse(url), headers: header);
    if (res.statusCode == 401) {
      alertService.error(Constants.unauthorized);
      navigatorKey.currentState?.pushReplacementNamed('login');
      clearStorage();
    } else {
      return res;
    }
  }
}
