import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.ordersRepo) : super(UpdateOrderInitial());
  final OrdersRepo ordersRepo;
  Future<void> updateOrder(
      {required String orderId, required OrderStatusEnum newStatus}) async {
    emit(UpdateOrderLoading());
    final result =
        await ordersRepo.updateOrderStatus(status: newStatus, orderId: orderId);
    result.fold(
        (failure) => emit(UpdateOrderFailure(errorMessage: failure.message)),
        (status) => emit(UpdateOrderSucess()));
  }
}
