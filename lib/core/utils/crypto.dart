import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

import 'constants.dart';

class Cryptography {
  static String generateMd5(String time) {
    var content = const Utf8Encoder()
        .convert(time + Constant.PRIVATE_KEY + Constant.PUBLIC_KEY);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
