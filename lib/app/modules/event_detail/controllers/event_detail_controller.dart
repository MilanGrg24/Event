import 'dart:convert';

import 'package:eventapp/app/models/event_details.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' as http;

import '../../../const/app_api.dart';
import '../../../const/helpers.dart';

class EventDetailController extends GetxController {
  // late EventsModel eventsModel;
  // late int eventDetailId;

  // fetchProductDetails() async {
  //   try {
  //     http.Response response = await AuthApiServices().eventDetail(eventDetailId);
  //     var responseBody = jsonDecode(response.body);
  //     if (response.statusCode! >= 200 && response.statusCode! < 300) {
  //       eventsModel = EventsModel.eventsModelFromJson(
  //         jsonEncode(responseBody["data"]),
  //       );
  //       update();
  //     } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
  //       var responseBody = jsonDecode(response.body);
  //       Helpers.showToastMessage(message: responseBody["message"]);
  //     } else {
  //       throw Exception();
  //     }
  //   } catch (e) {
  //     e.printError();
  //     Helpers.showToastMessage(message: "Something went wrong");
  //   }
  //   return eventsModel;
  // }
}
