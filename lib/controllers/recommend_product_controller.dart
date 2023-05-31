import 'package:e_commerce_with_backend/data/api/repostory/recommend_product_repo.dart';
import 'package:e_commerce_with_backend/model/product.dart';
import 'package:get/get.dart';

class RecommendProductController extends GetxController {
  final RecommendProductRepo recommendProductRepo;

  RecommendProductController({required this.recommendProductRepo});
  List<dynamic> _recommendProduct = [];
  List<dynamic> get recommendProduct => _recommendProduct;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<void> getRecommendProduct() async {
    Response response = await recommendProductRepo.getRecommendProductList();
    update();
    if (response.statusCode == 200) {
      _recommendProduct = [];

      _recommendProduct.addAll(Product.fromJson(response.body).product);
      update();
      _isLoading = true;
    }
  }
}
