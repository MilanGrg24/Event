import 'package:eventapp/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../models/login_response_model.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  LoginResponse? loginResponse;
  final storage = GetStorage();

  Future<void> login(String email, String password) async {
    if (email.isEmpty || !GetUtils.isEmail(email)) {
      Get.snackbar(
        'Invalid Input',
        'Please enter a valid email',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    if (password.isEmpty || password.length < 6) {
      Get.snackbar(
        'Invalid Input',
        'Password must be at least 6 characters',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    final url = Uri.parse('http://10.0.2.2:8000/api/auth/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'email': email, 'password': password});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData['status'] == true) {
          loginResponse = LoginResponse.fromJson(jsonData);
          // Save token
          storage.write('token', loginResponse!.token);

          Get.snackbar(
            backgroundColor: Color(0xFF673AB7),
            "Success",
            loginResponse!.message,
            colorText: Color(0xFFFFFFFF),
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.put(DashboardController());
          Get.offAll(() => DashboardView());
          update();
        } else {
          Get.snackbar(
            backgroundColor: Color(0xff0000),
            "Login Failed",
            jsonData['message'] ?? "Unknown error",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        Get.snackbar(
          "Server Error",
          "Something went wrong (${response.statusCode})",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Exception: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
