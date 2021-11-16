import 'dart:io';

String mockFile(String name) {
  String path = 'test/helper/$name';
  try {
    return File(path).readAsStringSync();
  } catch (e) {
    return File("../$path").readAsStringSync();
  }
}
