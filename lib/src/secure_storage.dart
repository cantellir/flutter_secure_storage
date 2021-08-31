abstract class SecureStorage {
  Future<void> delete(String key);
  Future<String?> read(String key);
  Future<void> write({
    required String key,
    required String value,
  });
}
