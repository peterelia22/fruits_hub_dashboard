import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_item.dart';

class OrderItemsListView extends StatelessWidget {
  const OrderItemsListView({super.key, required this.orders});
  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderDisplayWidget(order: orders[index]);
        });
  }
}
