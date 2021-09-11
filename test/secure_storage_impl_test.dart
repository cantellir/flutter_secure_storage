import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:secure_storage/secure_storage.dart';
import 'package:secure_storage/src/secure_storage_impl.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late SecureStorage sut;
  late FlutterSecureStorage flutterSecureStorage;

  final String fakeKey = 'fakeKey';
  final String fakeValue = 'fakeValue';

  setUp(() {
    flutterSecureStorage = MockFlutterSecureStorage();
    sut = SecureStorageImpl(flutterSecureStorage);
  });

  test('should return string value when read is called', () async {
    when(() => flutterSecureStorage.read(key: any(named: 'key')))
        .thenAnswer((_) => Future.value(fakeValue));

    final result = await sut.read(fakeKey);

    expect(result, fakeValue);
    verify(() => flutterSecureStorage.read(key: fakeKey)).called(1);
    verifyNoMoreInteractions(flutterSecureStorage);
  });

  test('should call client write when sut.write is called', () async {
    when(() => flutterSecureStorage.write(
        key: any(named: 'key'),
        value: any(named: 'value'))).thenAnswer((_) => Future.value());

    await sut.write(key: fakeKey, value: fakeValue);

    verify(() => flutterSecureStorage.write(key: fakeKey, value: fakeValue));
    verifyNoMoreInteractions(flutterSecureStorage);
  });

  test('should call client delete when sut.delete is called', () async {
    when(() => flutterSecureStorage.delete(key: any(named: 'key')))
        .thenAnswer((_) => Future.value());

    await sut.delete(fakeKey);

    verify(() => flutterSecureStorage.delete(key: fakeKey));
    verifyNoMoreInteractions(flutterSecureStorage);
  });
}
