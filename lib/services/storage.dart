import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = FlutterSecureStorage();
  static const _keyUsername = 'username';

  Future writeSecureData(String value) async {
    var writeData = await _storage.write(key: _keyUsername, value: value);
    return writeData;
  }

  Future readSecureData() async {
    var readData = await _storage.read(key: _keyUsername);
    return readData;
  }

  Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }
}
