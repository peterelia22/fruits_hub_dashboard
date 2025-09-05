import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_item.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_items_list_view.dart';

import '../../../../../core/helper_functions/get_order_dummy_data.dart';
import 'filter_section.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const FilterSection(),
          const SizedBox(
            height: 24,
          ),
          Expanded(child: OrderItemsListView(orders: orders))
        ],
      ),
    );
  }
}
