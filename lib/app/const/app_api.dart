import 'dart:io';
import 'package:http/http.dart' as http;

String baseUrl = "http://10.0.2.2:8000";

class AppApi {
  static AuthApis authApis = AuthApis();
  static String imageUrl = "$baseUrl/images/";
}

class AuthApis {
  AuthApis();
  String get eventDetails => "$baseUrl/api/events";
}

class AuthApiServices {
  var client = http.Client();

  Future event() async {
    try {
      Uri url = Uri.parse(AuthApis().eventDetails);
      var response = await client.get(url);
      return response;
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  Future eventIdDetail(int eventDetailId) async {
    try {
      Uri url = Uri.parse("${AuthApis().eventDetails}/$eventDetailId");
      var response = await client.get(url);
      return response;
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }
}
