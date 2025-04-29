import 'package:eventapp/app/modules/event_detail/controllers/event_detail_controller.dart';
import 'package:eventapp/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<EventDetailController>(() => EventDetailController());
  }
}
