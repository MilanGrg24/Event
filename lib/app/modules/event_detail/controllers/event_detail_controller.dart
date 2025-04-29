import 'dart:convert';
import 'package:eventapp/app/models/event_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EventDetailController extends GetxController {
  var isLoading = false.obs;
  Event? eventDetail;

  Future<void> fetchEventDetail(int id) async {
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/events/$id'), // your API URL here
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var data = jsonData['data']; // extract 'data' object
        eventDetail = Event.fromJson(data);
      } else {
        Get.snackbar("Error", "Failed to load event: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
      update(); // rebuild GetBuilder
    }
  }
}
