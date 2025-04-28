import 'package:get/get.dart';

class LoginValidationController extends GetxController {
  String? emailValidator(String email) {
    if (email.length < 4) {
      return "Invalid Email";
    }

    return null;
  }

  String? passwordValidator(String password) {
    if (password.isEmpty) {
      return "Valid Password is required";
    }
    if (password.length < 4 || password.length > 20) {
      return "Password should be at least 4 characters";
    }
    RegExp regex = RegExp("[A-Za-z0-9]+");

    if (!regex.hasMatch(password)) {
      return "Please Select Valid Password";
    }

    return null;
  }
}
