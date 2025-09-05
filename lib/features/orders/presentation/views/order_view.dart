import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/fetch_orders/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_view_body.dart';

import '../../domain/repos/orders_repo.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const String routeName = 'orders';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchOrdersCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: const OrderViewBody(),
      ),
    );
  }
}
