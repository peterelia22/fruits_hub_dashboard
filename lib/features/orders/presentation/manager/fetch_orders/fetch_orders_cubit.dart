import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:meta/meta.dart';

import '../../../domain/repos/orders_repo.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.ordersRepo) : super(FetchOrdersInitial());
  final OrdersRepo ordersRepo;
  void fetchOrders() async {
    emit(FetchOrdersLoading());
    await for (var result in ordersRepo.fetchOrders()) {
      result.fold(
          (failure) => emit(FetchOrdersFailure(errorMessage: failure.message)),
          (orders) => emit(FetchOrdersSuccess(orders: orders)));
    }
  }
}
