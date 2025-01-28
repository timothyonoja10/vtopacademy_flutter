
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

bool supportsOfflineStorage() {
  if (kIsWeb) return false;
  return Platform.isAndroid || Platform.isIOS || Platform.isMacOS;
}
