import 'package:applicatiion_uploding/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginscreenController with ChangeNotifier {
  bool isloading = false;
  onLogin({required String email, required String password}) async {
    //url setup
    final url = Uri.parse("https://freeapi.luminartechnohub.com/login");
    isloading = true;
    notifyListeners();

    try {
      //call http method
      final response = await http.post(url, body: {email, password});
      // check statuscode
      if (response.statusCode == 200) {
        // cover data
        LoginResModel loginModel = loginResModelFromJson(response.body);
        if (loginModel.access != null && loginModel.access!.isNotEmpty) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("access", loginModel.access.toString());
          await prefs.setString("refresh", loginModel.refresh.toString());
        }
      }
    } catch (e) {}
    isloading = false;
    notifyListeners();
  }
}
