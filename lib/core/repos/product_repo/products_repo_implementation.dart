import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/models/add_product_input_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entites/add_product_input_entity.dart';

class ProductsRepoImplementation implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImplementation(this.databaseService);
  @override
  Future<Either<Failure, void>> addProduct(
      AddProductInputEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
          path: BackendEndpoint.addProducts,
          data:
              AddProductInputModel.fromEntity(addProductInputEntity).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product: $e'));
    }
  }
}
