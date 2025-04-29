import 'dart:convert';
import 'package:eventapp/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../models/register_model.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  final name = ''.obs;
  final email = ''.obs;
  final phone = ''.obs;
  final password = ''.obs;
  final passwordConfirmation = ''.obs;

  Future<void> registerUser() async {
    isLoading.value = true;

    try {
      var response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name.value,
          'email': email.value,
          'phone': phone.value,
          'password': password.value,
          'password_confirmation': passwordConfirmation.value,
        }),
      );

      if (response.statusCode == 200) {
        var registerModel = RegisterModel.fromJson(jsonDecode(response.body));
        if (registerModel.status == "Success") {
          Get.snackbar("Success", registerModel.message);
          // You can navigate to login page after successful registration
          Get.to(LoginView());
        } else {
          Get.snackbar("Error", registerModel.message);
        }
      } else {
        Get.snackbar("Error", "Server Error: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
