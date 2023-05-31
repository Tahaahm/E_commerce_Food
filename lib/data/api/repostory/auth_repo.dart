// ignore_for_file: await_only_futures

import 'package:e_commerce_with_backend/data/api/api_client.dart';
import 'package:e_commerce_with_backend/model/signup_body_model.dart';
import 'package:e_commerce_with_backend/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstant.REGISRATION_URI, signUpBody.toJson());
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstant.PHONE) ?? "None";
  }

  Future<Response> login(String email, String password) async {
    return await apiClient.postData(
        AppConstant.LOGIN_URI, {"email": email, "password": password});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);

    return await sharedPreferences.setString(AppConstant.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    await sharedPreferences.setString(AppConstant.PHONE, number);
    await sharedPreferences.setString(AppConstant.PASSWORD, password);
    try {} catch (e) {
      throw e;
    }
  }
}
