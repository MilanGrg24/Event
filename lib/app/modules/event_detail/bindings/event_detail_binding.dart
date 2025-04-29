import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/event_detail_controller.dart';

class EventDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventDetailController>(
      () => EventDetailController(),
    );
        Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
