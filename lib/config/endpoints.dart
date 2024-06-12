/* ===============================================================
| Project : SIFR
| Page    : END_POINTS.DART
| Date    : 22-MAR-2023
|
*  ===============================================================*/
// Dependencies or Plugins - Models - Services - Global Functions

class EndPoints {
  /*
    * This End Points URL are based of development and production
  */
  static const baseApi9502 = 'https://sandboxdev.omaemirates.com:9502';
  static const baseSwitchMonitoring = 'http://172.29.100.221:9508';
  static const baseApi9503 = 'https://sandboxdev.omaemirates.com:9503';
  static const baseApi8988 = 'https://softposreceipt.omaemirates.com:8988';
  static const serviceUrl =
      "https://sandboxdev.omaemirates.com:9506/customer/v1";
  /*
    * This Short apis used for code reduce.
  */
  static const nanoServiceUrl = '/NanoCustomerService/v1/customer';
  static const nanoBankService = '/NanoSmartBanking/v1/smartBanking';

  // SIFR logo api
  static const sifrLogo = '$baseApi8988/SoftPOS/SifrLogo/';
  // Slider image for dashboard
  static const slideUrl = "/SoftPOS/Sifr/AppSilderimages";

  /*
    * User Related APIs
  */
  static const loginAPI = "/NanoCustomerService/v1/login";
  static const dashBoardData = "/NanoPay/Middleware/UiApi/getTransactionDashboardData";

  /*
    *  Local api development
    *  1. to load security question in register page
    *  2. load terms and conditions
    *  3. FAQ
    *  4. Country
  */
  static const getSecurityQuestions = "$serviceUrl/getSecurityQuestionDetails";
  static const getTermsAndCondition = "$serviceUrl/getContentDetails/";
  static const getFaq = "$serviceUrl/getFaqDetails";
  static const getCountry = "$serviceUrl/getCountryDetails";
  static const getState = "$serviceUrl/getStateDetails/";
  static const getCity = "$serviceUrl/getCityDetails/";

  /*
    * User Reset and Change Password and PIN
  */
  static const mobileOtpAPI = "/NanoCustomerService/v1/mobileOtp";
  static const mobileOtpValidateAPI = "$nanoServiceUrl/validateOTP";
  static const resetChangeApi = "$nanoServiceUrl/passwordResetOrChange";
  static const changeMpinAPI = "$resetChangeApi/changeMpin";
  static const changePasswordAPI = "$resetChangeApi/changePwd";
  static const resetPasscodeAPI = "$resetChangeApi/pwdReset";

  static const forgetUserNameAPI = "$nanoServiceUrl/forgotUserName/";
  static const securityQuestionAPI = "$nanoServiceUrl/getSecurityQuestion/";
  static const securityQuestionVerificationAPI =
      "$nanoServiceUrl/verifySecurityAnswers";

  /*
    * App Based Other apis
    * 1. Notification api for listing the notification.
    * 2. Get Customer info api
    * 3. Transaction List api
    * 4. Nearest Location api to show merchant location.
  */
  static const notificationListing = "$nanoBankService/getNotifications/";
  static const notificationStatus = "$nanoBankService/viewNotification/SIFR";
  static const getCustomerDetails = "$nanoServiceUrl/getCustomerInfo/";
  static const transactionListing = "$nanoBankService/transactionSearch";
  static const nearestLocation = "$nanoServiceUrl/nearestGeoLocation";
}
