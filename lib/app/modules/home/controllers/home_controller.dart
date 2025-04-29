import 'package:eventapp/app/const/app_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../const/helpers.dart';
import '../../../models/event_details.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var eventList = <Event>[].obs;
  int? eventDetailId;

  @override
  void onInit() {
    fetchEvents();
    fetchEventId();
    super.onInit();
  }

  void fetchEvents() async {
    try {
      isLoading(true);
      http.Response response = await AuthApiServices().event();
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List events = data['data'];
        eventList.value = events.map((e) => Event.fromJson(e)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load events');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading(false);
    }
  }

  void fetchEventId() async {
    try {
      http.Response response = await AuthApiServices().eventIdDetail(
        eventDetailId!,
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var data = json.decode(response.body);
        List eventDetail = data['data'];
        eventList.value = eventDetail.map((e) => Event.fromJson(e)).toList();
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        var responseBody = jsonDecode(response.body);
        Helpers.showToastMessage(message: responseBody["message"]);
      } else {
        throw Exception();
      }
    } catch (e) {
      e.printError();
      // Helpers.showToastMessage(message: "");
    }
  }
}
