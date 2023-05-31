import 'package:e_commerce_with_backend/data/api/api_client.dart';
import 'package:e_commerce_with_backend/utils/app_constant.dart';
import 'package:e_commerce_with_backend/utils/colors.dart';
import 'package:get/get.dart';

class RecommendProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendProductRepo({required this.apiClient});

  Future<Response> getRecommendProductList() async {
    return await apiClient.getData(AppConstant.RECOMMEND_PRODUCT_URI);
  }
}
