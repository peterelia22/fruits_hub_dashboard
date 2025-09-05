import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entites/products_entity.dart'
    show ProductsEntity;

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct(ProductsEntity product);
}
