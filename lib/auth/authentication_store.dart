import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationStore {
  final _secureStorage = FlutterSecureStorage();

  // Check if the user is an admin
  Future<bool> isAdmin() async {
    String? result = await _secureStorage.read(key: 'isAdmin');
    return result != null;
  }

  // Check if the access token is valid
  Future<bool> hasAccessToken() async {
    try {
      String? accessToken = await _secureStorage.read(key: 'accessToken');
      if (accessToken == null) {
        return false;
      }
      
      // Check expiry date
      String? expiryDay = await _secureStorage.read(key: 'expiryDay');
      String? expiryMonth = await _secureStorage.read(key: 'expiryMonth');
      String? expiryYear = await _secureStorage.read(key: 'expiryYear');
      String? expiryHour = await _secureStorage.read(key: 'expiryHour');
      String? expiryMinute = await _secureStorage.read(key: 'expiryMinute');

      if (expiryDay != null &&
          expiryMonth != null &&
          expiryYear != null &&
          expiryHour != null &&
          expiryMinute != null) {
        DateTime expiryDate = DateTime(
          int.parse(expiryYear),
          int.parse(expiryMonth),
          int.parse(expiryDay),
          int.parse(expiryHour),
          int.parse(expiryMinute),
        );

        // Compare with the current time
        if (DateTime.now().isBefore(expiryDate)) {
          return true;
        } else {
          await deleteAuthInfo();
          return false;
        }
      }
      return false;
    } catch (e) {
      // Handle error reading values
      return false;
    }
  }

  // Retrieve the access token
  Future<String> getAccessToken() async {
    if (await hasAccessToken()) {
      try {
        String? result = await _secureStorage.read(key: 'accessToken');
        return result ?? '';
      } catch (e) {
        // Error reading value
        return '';
      }
    } else {
      return '';
    }
  }

  // Save authentication information
  Future<bool> saveAuthInfo(
      String accessToken, bool isAdmin, bool isUser, int expiryInDays) async {
    try {
      await _secureStorage.write(key: 'accessToken', value: accessToken);
      if (isAdmin) {
        await _secureStorage.write(key: 'isAdmin', value: 'true');
      }
      if (isUser) {
        await _secureStorage.write(key: 'isUser', value: 'true');
      }

      // Calculate expiry date based on the given number of days
      DateTime expiryDate = DateTime.now().add(Duration(days: expiryInDays));

      // Save expiry details
      await _secureStorage.write(key: 'expiryDay', value: expiryDate.day.toString());
      await _secureStorage.write(key: 'expiryMonth', value: (expiryDate.month).toString());
      await _secureStorage.write(key: 'expiryYear', value: expiryDate.year.toString());
      await _secureStorage.write(key: 'expiryHour', value: expiryDate.hour.toString());
      await _secureStorage.write(key: 'expiryMinute', value: expiryDate.minute.toString());

      return true;
    } catch (e) {
      return false;
    }
  }

  // Delete all authentication information
  Future<bool> deleteAuthInfo() async {
    try {
      await _secureStorage.delete(key: 'isAdmin');
      await _secureStorage.delete(key: 'isUser');
      await _secureStorage.delete(key: 'accessToken');
      await _secureStorage.delete(key: 'expiryDay');
      await _secureStorage.delete(key: 'expiryMonth');
      await _secureStorage.delete(key: 'expiryYear');
      await _secureStorage.delete(key: 'expiryHour');
      await _secureStorage.delete(key: 'expiryMinute');
      return true;
    } catch (e) {
      return false;
    }
  }
}
