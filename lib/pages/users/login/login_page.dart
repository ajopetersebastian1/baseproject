import 'dart:convert';
import 'dart:ffi';

import 'package:baseproject/config/config.dart';
import 'package:baseproject/gen/assets.gen.dart';
import 'package:baseproject/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/login_models.dart';
import '../../../providers/providers.dart';
import '../../../pub_codes/swipe_button.dart';
import '../../../storage/secure_storage.dart';
import '../../../widgets/app/alert_service.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/patternWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginRequestModel requestModel = LoginRequestModel();
  UserServices userServices = UserServices();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  String password = "Password";
  String pin = "PIN";
  var keyboardType = TextInputType.text;
  final FocusNode _focusNode = FocusNode();
  late PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );
  // VARIABLE DECLARATION
  late bool _isLoading = false;
  bool hidePassword = true;
  bool isFinished = false;
  final List<bool> _activeToggleMenu = [true, false];
  AlertService alertWidget = AlertService();

  @override
  void initState() {
    DevicePermission().checkPermission();
    _initPackageInfo();
    super.initState();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: _isLoading
            ? const LoadingWidget()
            : BackgroundPattern(
                childData: childData(),
              ));
  }

  childData() {
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
        child: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Switch Monitoring",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
          ),
          const SizedBox(height: 10),

          LottieBuilder.asset(Assets.lottie.loginAnimation,
              height: screenHeight * 0.35, fit: BoxFit.fill),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Login to your Account",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
          ),
          const SizedBox(height: 20),
          // toggledButton(),
          const SizedBox(height: 10),
          userNameField(),
          passwordField(),
          const SizedBox(height: 10.0),
          //login(),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            // forgotUserName(),
            forgotPassword(),
          ]),
          const SizedBox(height: 10),
          swipeButton(),
          const SizedBox(height: 10),

          Text("App Version ${_packageInfo.version.toString()}"),
        ],
      ),
    ));
  }

  submitLoginForm() async {
    if (_formKey.currentState!.validate()) {
      setLoading(true);
      _formKey.currentState!.save();
      requestModel.instId = Constants.instId;
      requestModel.deviceType = Constants.deviceType;
      requestModel.deviceId =
          await Validators.encrypt(await Global.getUniqueId());
      password == 'Password'
          ? requestModel.pin = null
          : requestModel.password = null;
      if (password == 'Password') {
        requestModel.pin = null;
        requestModel.password =
            await Validators.encrypt(requestModel.password.toString());
      } else {
        requestModel.password = null;
        requestModel.pin =
            await Validators.encrypt(requestModel.pin.toString());
      }
      print(json.encode(requestModel));
      print("Login URL");
      _passwordController.clear();
      userServices.loginService(requestModel).then((response) async {
        var result = jsonDecode(response.body);
        // print(result);
        var code = response.statusCode;
        if (code == 200 || code == 201) {
          if (result['responseCode'] == "00") {
            saveSecureStorage(result);
            Navigator.pushReplacementNamed(context, 'home');
            setLoading(false);
          } else if (result['responseCode'] == "03") {
            setLoading(false);
            alertWidget.failure(context, 'Failure',
                result['responseMessage'] ?? 'Something went wrong');
            // Navigator.pushReplacementNamed(context, "loginAuthOtp");
            Navigator.pushNamed(context, 'loginAuthOtp',
                arguments: {'userDetails': json.encode(requestModel)});
          } else {
            setLoading(false);
            alertWidget.failure(context, 'Failure',
                result['responseMessage'] ?? 'Something went wrong');
          }
        } else {
          setLoading(false);
          alertWidget.failure(context, 'Failure', result['message']);
        }
      });
    }
  }

  saveSecureStorage(decodeData) async {
    /// NEW HIVE STORAGE CONTROLS
    var datetime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    String dateStr = datetime.toString();
    BoxStorage secureStorage = BoxStorage();
    secureStorage.saveUserDetails(decodeData);
    secureStorage.save('lastLogin', dateStr);
    secureStorage.save('isLogged', true);
    // secureStorage.save('notificationToken', decodeData.notificationToken);
    if (decodeData['role'].toString() == "MERCHANT") {
      secureStorage.save('merchantStatus', decodeData['status'].toString());
    }

    /// OLD Shared Preferences STORAGE CONTROLS
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', decodeData['bearerToken'].toString());
    prefs.setString('userName', decodeData['userName'].toString());
    prefs.setString('role', decodeData['role'].toString());
    prefs.setString('lastLogin', dateStr);
    prefs.setBool('isLogged', true);
    prefs.setString('custId', decodeData['custId'].toString());
    if (decodeData['role'].toString() == "MERCHANT") {
      prefs.setString('merchantId', decodeData['merchantId'].toString());
      prefs.setString('terminalId', decodeData['terminalId'].toString());
      prefs.setString(
          'kycExpiryAlertMsg', decodeData['kycExpiryAlertMsg'].toString());
    }
  }

  setLoading(bool tf) {
    setState(() {
      _isLoading = tf;
    });
  }

  userNameField() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
          keyboardType: TextInputType.text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'\w'))
          ],
          decoration: InputDecoration(
            labelText: "Username *",
            labelStyle:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            prefixIcon: Icon(Icons.person_2_outlined,
                size: 25, color: Theme.of(context).primaryColor),
          ),
          onSaved: (value) {
            requestModel.userName = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Username!';
            }
            if (value.length < 3) {
              return 'Minimum character length is 3';
            }
            if (!RegExp(r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$')
                .hasMatch(value)) {
              return 'Invalid username!';
            }

            return null;
          }),
    );
  }

  passwordField() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: TextFormField(
        controller: _passwordController,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
        obscureText: hidePassword,
        obscuringCharacter: '*',
        maxLength: password != 'Password' ? 4 : null,
        focusNode: _focusNode,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: (value) {
          password == 'Password'
              ? requestModel.password = value
              : requestModel.pin = value;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $password!';
          }
          if (password == 'Password') {
            // if (!Validators.isPassword(value)) {
            //   return Constants.passwordError;
            // }
          } else {
            if (value.length != 4) {
              return 'Login PIN must be 4 digits';
            }
            if (Validators.isConsecutive(value) != -1) {
              return 'Login PIN should not be consecutive digits.';
            }
          }

          return null;
        },
        inputFormatters: <TextInputFormatter>[
          password != 'Password'
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter
        ],
        decoration: InputDecoration(
          labelText: '$password *',
          counterText: "",
          labelStyle:
              Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          prefixIcon: Icon(
            Icons.lock,
            size: 25,
            color: Theme.of(context).primaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            icon: Icon(
              hidePassword ? Icons.visibility_off : Icons.visibility,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  login() {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          _passwordController.clear();
          setState(() {
            if (password == 'Password') {
              _focusNode.unfocus();
              keyboardType = TextInputType.number;
              Future.delayed(const Duration(milliseconds: 150)).then((value) {
                _focusNode.requestFocus();
              });
            } else {
              _focusNode.unfocus();
              keyboardType = TextInputType.text;
              Future.delayed(const Duration(milliseconds: 150)).then((value) {
                _focusNode.requestFocus();
              });
            }
            password == 'Password' ? password = 'PIN' : password = 'Password';
            pin == 'PIN' ? pin = 'Password' : pin = 'PIN';
          });
        },
        child: Text(
          "Login using $pin",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  forgotPassword() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, 'forgotPage', arguments: password);
      },
      child: Text("Forgot $password?",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  forgotUserName() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, 'forgotUserName');
      },
      child: Text("Forgot Username?",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  swipeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 8,
      ),
      child: SwipeButton.expand(
        elevationThumb: 5,
        elevationTrack: 5,
        duration: const Duration(milliseconds: 100),
        thumb: const Icon(
          Icons.double_arrow_rounded,
          color: Colors.white,
        ),
        activeThumbColor: Theme.of(context).primaryColor,
        activeTrackColor: Theme.of(context).primaryColor.withOpacity(0.7),
        onSwipe: () {
          Navigator.pushReplacementNamed(context, 'monitoring');
          // submitLoginForm();
        },
        child: const Text(
          "Swipe to Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
