import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

class criptografia{
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
}