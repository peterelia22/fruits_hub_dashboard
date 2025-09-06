import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/get_order_dummy_data.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/fetch_orders/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order/update_order_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/repos/orders_repo.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const String routeName = 'orders';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchOrdersCubit(getIt.get<OrdersRepo>()),
        ),
        BlocProvider(
          create: (context) => UpdateOrderCubit(getIt.get<OrdersRepo>()),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: const OrderViewBodyBlocBuilder(),
      ),
    );
  }
}

class OrderViewBodyBlocBuilder extends StatefulWidget {
  const OrderViewBodyBlocBuilder({
    super.key,
  });

  @override
  State<OrderViewBodyBlocBuilder> createState() =>
      _OrderViewBodyBlocBuilderState();
}

class _OrderViewBodyBlocBuilderState extends State<OrderViewBodyBlocBuilder> {
  @override
  void initState() {
    context.read<FetchOrdersCubit>().fetchOrders();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrderViewBody(
            orders: state.orders,
          );
        } else if (state is FetchOrdersFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Skeletonizer(
              child: OrderViewBody(orders: [createSampleOrder()]));
        }
      },
    );
  }
}
