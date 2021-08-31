import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorageImpl(this._storage);

  @override
  Future<void> delete(String key) {
    return _storage.delete(key: key);
  }

  @override
  Future<String?> read(String key) {
    return _storage.read(key: key);
  }

  @override
  Future<void> write({
    required String key,
    required String value,
  }) {
    return _storage.write(key: key, value: value);
  }
}
