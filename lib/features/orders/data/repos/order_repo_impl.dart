import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderRepoImpl implements OrdersRepo {
  final DatabaseService databaseService;

  OrderRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      final response = await databaseService.getData(
        path: BackendEndpoint.getOrders,
      );
      List<OrderEntity> orders = (response as List<dynamic>)
          .map((e) => OrderModel.fromJson(e).toEntity())
          .toList() as List<OrderEntity>;
      return Right(orders);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch orders'));
    }
  }
}
