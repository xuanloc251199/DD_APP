import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dd_app/utilities/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? localStorage;

class AllNotificationsAPI {
  Future<dynamic> getNotification() async {
    localStorage = await SharedPreferences.getInstance();
    print(localStorage != null ? true : false);
    print(localStorage?.get('Authorization'));

    try {
      http.Response response = await http.get(
        Uri.parse(baseUrl + notifications),
        headers: <String, String>{
          'Authorization': 'Bearer ${localStorage?.get('Authorization')}',
          'Customer-ID': '${localStorage?.get('Customer-ID')}',
        },
      );
      print(response.body);

      return json.decode(response.body);
    } catch (e) {
      print("Exception Caught which is ");
    }
  }
}
