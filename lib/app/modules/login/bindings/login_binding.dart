import 'package:eventapp/app/modules/login/controllers/login_validation.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginValidationController>(() => LoginValidationController());
  }
}
