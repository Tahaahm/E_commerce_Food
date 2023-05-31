// ignore_for_file: unused_local_variable, avoid_print

import 'package:e_commerce_with_backend/data/api/repostory/auth_repo.dart';
import 'package:e_commerce_with_backend/model/response_model.dart';
import 'package:e_commerce_with_backend/model/signup_body_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<ResponseModel> registeration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel reponseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['token']);
      reponseModel = ResponseModel(true, response.body['token']);
    } else {
      reponseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return reponseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    print("getting Token");
    print(authRepo.getUserToken());
    _isLoading = true;
    update();
    Response response = await authRepo.login(email, password);
    late ResponseModel reponseModel;
    if (response.statusCode == 200) {
      print("Backend token");
      authRepo.saveUserToken(response.body['token']);
      reponseModel = ResponseModel(true, response.body['token']);
      print(response.body['token']);
    } else {
      reponseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return reponseModel;
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }
}
