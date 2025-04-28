import 'package:eventapp/app/models/user_model.dart';
import 'package:eventapp/app/modules/login/views/login_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' as http;
import '../../../const/app_api.dart';
import '../../../const/helpers.dart';

class RegisterController extends GetxController {
  // var ishidden = true.obs;
  // TextEditingController emailTextEditingController = TextEditingController();
  // TextEditingController passwordTextEditingController = TextEditingController();
  // TextEditingController userNameTextEditingController = TextEditingController();
  // TextEditingController contactTextEditingController = TextEditingController();

  // register() async {
  //   try {
  //     UserModel registerModel = UserModel(
  //         name: userNameTextEditingController.text,
  //         email: emailTextEditingController.text,
  //         password: passwordTextEditingController.text,
  //         phone: contactTextEditingController.text);

  //     http.Response response =
  //         await AuthApiServices().registerUser(registerModel);
  //     if (response.statusCode !>= 200 && response.statusCode !< 300) {
  //       Get.to(() => LoginView());
  //       Helpers.showMessage(
  //           message: "User Registered SucessFully", isError: false);
  //     } else if (response.statusCode !>= 400 && response.statusCode !< 500) {
  //       // ignore: unused_local_variable
  //       // var responseBody = jsonDecode(response.body);
  //       Helpers.showMessage(message: "Empty data in the field", isError: true);
  //     } else {
  //       throw Exception();
  //     }
  //   } catch (e) {
  //     e.printError();
  //     Helpers.showMessage(message: "Something went wrong ", isError: true);
  //   }
  // }
}
