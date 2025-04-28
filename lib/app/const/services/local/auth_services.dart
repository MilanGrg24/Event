import 'secure_storage_services.dart';

class AuthService {
  static Future<bool> isUserLoggedIn() async {
    try {
      String? accessToken = await SecureStorageService().getValue(
        key: "accessToken",
      );
      if (accessToken == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
