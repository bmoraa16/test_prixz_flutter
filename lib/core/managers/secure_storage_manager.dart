import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  static final SecureStorageManager _instance =
      SecureStorageManager._internal();

  factory SecureStorageManager() {
    return _instance;
  }

  SecureStorageManager._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  write(String key, String value) async {
    await _instance._storage.write(key: key, value: value);
    return null;
  }
}
