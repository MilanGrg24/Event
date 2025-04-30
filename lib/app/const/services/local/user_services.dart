import 'package:eventapp/app/modules/home/bindings/home_binding.dart';
import 'package:eventapp/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'secure_storage_services.dart';

class UserService extends GetxService {
  // late UserModel user;
  late String userToken;

  authenticateUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    userToken = token!;
    await getUsers();
    Get.to(() => HomeView(), binding: HomeBinding());
  }

  Future getUsers() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? value = pref.getString('user');
    // user = UserModel.userModelFromJson(value!);
  }

  static logOut() async {
    SecureStorageService secureStorageService = SecureStorageService();
    secureStorageService.delete(shouldDeleteAll: true);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Get.offNamedUntil('login', (route) => false);
  }
}
