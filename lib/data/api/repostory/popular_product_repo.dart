import 'package:e_commerce_with_backend/data/api/api_client.dart';
import 'package:e_commerce_with_backend/utils/app_constant.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstant.POPULAR_PRODUCT_URI);
  }
}
