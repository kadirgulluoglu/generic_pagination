import 'package:generic_pagination/core/base/base_pagination_viewmodel.dart';
import 'package:generic_pagination/features/product/model/product_model.dart';
import 'package:generic_pagination/features/product/service/product_service.dart';

class ProductViewModel extends PaginationViewModel<Product> {
  final ProductService _service = ProductService.instance;

  ProductViewModel() {
    initial();
  }

  void initial() {
    loadFirstPage();
  }

  ProductModel? productModel;
  @override
  Future<List<Product>?> fetchData(int pageIndex) async {
    try {
      productModel =
          await _service.getProduct(pageIndex: pageIndex, pageSize: pageSize);
      return productModel?.product;
    } catch (e) {
      return null;
    }
  }

  @override
  int getTotalCount() {
    return productModel?.totalCount ?? 0;
  }
}
