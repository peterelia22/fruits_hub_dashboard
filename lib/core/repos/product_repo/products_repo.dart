import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entites/add_product_input_entity.dart'
    show AddProductInputEntity;

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct(AddProductInputEntity product);
}
