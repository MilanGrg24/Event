import 'package:eventapp/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';
import '../../favourite/controllers/favourite_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../login/controllers/login_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<EventDetailController>(() => EventDetailController());
    Get.lazyPut<FavouriteController>(() => FavouriteController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
