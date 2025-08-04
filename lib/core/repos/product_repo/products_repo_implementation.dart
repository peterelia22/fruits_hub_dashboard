import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo.dart'
    show ProductsRepo;
import 'package:fruits_hub_dashboard/features/add_product/domain/entites/add_product_input_entity.dart';

class ProductsRepoImplementation implements ProductsRepo {
  @override
  Future<void> addProduct(AddProductInputEntity product) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
}
