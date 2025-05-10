import 'package:get/get.dart';

class FavouriteController extends GetxController {
  var favouriteList = [].obs;

  void addToFavourite(dynamic event) {
    favouriteList.add(event);
  }

  void removeFromFavourite(dynamic event) {
    favouriteList.remove(event);
  }
}
