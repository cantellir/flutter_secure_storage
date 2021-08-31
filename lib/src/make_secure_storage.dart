import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'secure_storage.dart';
import 'secure_storage_impl.dart';

SecureStorage makeSecureStorage() => SecureStorageImpl(FlutterSecureStorage());
