import 'package:generic_pagination/core/network/network_manager.dart';
import 'package:generic_pagination/features/product/model/product_model.dart';

class ProductService {
  static ProductService? _instance;

  static ProductService get instance => _instance ??= ProductService._init();

  ProductService._init();

  Future getProduct({
    required int pageIndex,
    required int pageSize,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    final response = await NetworkManager.instance?.get(
      "Product",
      queryParams: {
        "pageSize": pageSize,
        "pageIndex": pageIndex,
      },
    );
    return productFromJson(response?.data);
  }
}
