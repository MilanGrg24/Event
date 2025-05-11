import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../models/booking.dart';

class ProfileController extends GetxController {
  var bookings = <Booking>[].obs;
  var isLoading = false.obs;
  final storage = GetStorage(); // Get token from local storage

  Future<void> fetchBookings() async {
    isLoading.value = true;

    // Get token from storage
    final token = storage.read('token');

    if (token == null) {
      print("No token found. User might not be logged in.");
      isLoading.value = false;
      return;
    }

    final response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/bookings"),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List dataList = jsonData['data']['data'];
      bookings.value = dataList.map((e) => Booking.fromJson(e)).toList();
    } else {
      // print("Error fetching bookings: ${response.body}");
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    fetchBookings();
  }
}
