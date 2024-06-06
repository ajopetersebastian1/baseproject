/* ===============================================================
| Project : SIFR
| Page    : VALIDATORS.DART
| Date    : 22-MAR-2023
|
*  ===============================================================*/

// Dependencies
import 'package:aes256gcm/aes256gcm.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt.dart';

// Validators Class
class Validators {
  /* Global Encrypt Password */
  static Future<String> encrypt(String key) async {
    print(key);
    var password = 'naethratechnologiespvtltdchennai';
    var encrypted = await Aes256Gcm.encrypt(key, password);
    print('Encrypted: $encrypted');
    // Decrypt the encrypted value
    var decrypted = await Aes256Gcm.decrypt(encrypted, password);
    print('Decrypted: ${decrypted == key}');
    print('Decrypted: ${decrypted}');

    return encrypted;
  }

  /* Global Decrypt Password */
  // static Future<String> decrypt(String key) async {
  //   var password = 'naethratechnologiespvtltdchennai';
  //   var encrypted = await Aes256Gcm.decrypt(key, password);
  //   return encrypted;
  // }

  static String urlDecrypt(String plainText) {
    final key = Key.fromUtf8('kycDocsEncrypKey');
    final iv = IV.fromLength(16);
    final encrypted = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypted.decrypt64(plainText, iv: iv).toString();
    return decrypted;
  }

  static String urlDecryptEBC(String plainText) {
    final key = Key.fromUtf8('kycDocsEncrypKey');
    final iv = IV.fromLength(16);
    final encrypted = Encrypter(AES(key, mode: AESMode.ecb));
    final decrypted = encrypted.decrypt64(plainText, iv: iv).toString();
    return decrypted;
  }

  static String encryptWithDocKey(String plainText) {
    final key = Key.fromUtf8('kycDocsEncrypKey');
    final iv = IV.fromLength(16);
    final encryptor = Encrypter(AES(key, mode: AESMode.cbc));
    var encrypted = encryptor.encrypt(plainText, iv: iv);
    print(encrypted.base64);
    return encrypted.base64;
  }

  static String encryptTest() {
    final key = Key.fromUtf8('kycDocsEncrypKey');
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    // Message to encrypt
    final plainText = '0000000001039';

    // Encrypt
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    print('Encrypted: ${encrypted.base64}');
    var aa = "J4oz8gUonLL795wuHHSlBA==";
    // Decrypt
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    print('Decrypted: $decrypted');
    return encrypted.base64;
  }

  /* Global Email Validation */
  static bool isValidEmail(String email) {
    final bool isValid = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
    return isValid;
  }

  /* Global Email Validation */
  static bool isAlphaNumeric(String name) {
    final bool isValid =
        RegExp(r'^[-a-zA-Z\d]+(\s[-a-zA-Z\d]+)*$').hasMatch(name);
    return isValid;
  }

  /* Global Password Validation */
  static bool isPassword(String password) {
    final bool isValid =
        RegExp(r'^(?=.*\d)(?=.*[A-Z a-z])(?=.*[@#$%^&+*!=]).{8,}.*$')
            .hasMatch(password);
    return isValid;
  }

  /* Global Username Validation */
  static bool isValidName(String name) {
    return RegExp(r'^[-a-zA-Z]+(\s[-a-zA-Z]+)*$').hasMatch(name);
  }

  /* Global FormField Validation */
  static bool isValidField(String name) {
    return RegExp(r'^[-a-zA-Z\d]+(\s[-a-zA-Z\d]+)*$').hasMatch(name);
  }

  /* Global Pin/Mpin Consequence Validators */
  static int isConsecutive(str) {
    int start;
    int length = str.length;
    for (int i = 0; i < length / 2; i++) {
      var newStr = str.substring(0, i + 1);
      int num = int.parse(newStr);
      start = num;
      while (newStr.length < length) {
        num++;
        newStr = newStr + (num).toString();
      }
      if (newStr == (str)) return start;
    }
    for (int i = 0; i < length / 2; i++) {
      str = str.split('').reversed.join();
      var newStr = str.substring(0, i + 1);
      int num = int.parse(newStr);
      start = num;
      while (newStr.length < length) {
        num++;
        newStr = newStr + (num).toString();
      }
      if (newStr == (str)) return start;
    }
    for (int i = 0; i < length / 2; i++) {
      str = str.split('').reversed.join();
      var newStr = str.substring(0, i + 1);
      int num = int.parse(newStr);
      start = num;
      while (newStr.length < length) {
        newStr = newStr + (num).toString();
      }
      if (newStr == (str)) {
        return 1;
      } else {
        return -1;
      }
    }
    return -1;
  }
}
