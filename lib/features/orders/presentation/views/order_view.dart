import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const String routeName = 'orders';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: const OrderViewBody(),
    );
  }
}
