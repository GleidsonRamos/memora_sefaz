import 'dart:io';
import 'package:simple_rsa/simple_rsa.dart';

class criptografia{
  /*
  static String Encrypt(String text) {
    final publicKeyFile = File('/path/to/public_key.pem');//NAO CONSEGUI BAIXAR AS CHAVES NO EMAIL :'(
    final privateKeyFile = File('/path/to/private_key.pem');
    final parser = RSAKeyParser();
    final RSAPublicKey publicKey = parser.parse(publicKeyFile.readAsStringSync());
    final RSAPrivateKey privateKey = parser.parse(privateKeyFile.readAsStringSync());
    final encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privateKey));
    var encrypted = encrypter.encrypt(text);
    return encrypted.base64;
  }
  */

  static Future<String> criptografar(String text) async{
    final PUBLIC_KEY =
        "MIIBITANBgkqhkiG9w0BAQEFAAOCAQ4AMIIBCQKCAQBuAGGBgg9nuf6D2c5AIHc8" +
            "vZ6KoVwd0imeFVYbpMdgv4yYi5obtB/VYqLryLsucZLFeko+q1fi871ZzGjFtYXY" +
            "9Hh1Q5e10E5hwN1Tx6nIlIztrh5S9uV4uzAR47k2nng7hh6vuZ33kak2hY940RSL" +
            "H5l9E5cKoUXuQNtrIKTS4kPZ5IOUSxZ5xfWBXWoldhe+Nk7VIxxL97Tk0BjM0fJ3" +
            "8rBwv3++eAZxwZoLNmHx9wF92XKG+26I+gVGKKagyToU/xEjIqlpuZ90zesYdjV+" +
            "u0iQjowgbzt3ASOnvJSpJu/oJ6XrWR3egPoTSx+HyX1dKv9+q7uLl6pXqGVVNs+/" +
            "AgMBAAE=";

    String tmp = await encryptString(text, PUBLIC_KEY);
    return tmp;
  }
}