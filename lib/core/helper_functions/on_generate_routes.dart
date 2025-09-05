import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/add_product_view.dart'
    show AddProductView;
import 'package:fruits_hub_dashboard/features/orders/presentation/views/order_view.dart';

import '../../features/dashboard/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(
        builder: (context) => const DashboardView(),
      );
    case AddProductView.routeName:
      return MaterialPageRoute(
        builder: (context) => const AddProductView(),
      );
    case OrderView.routeName:
      return MaterialPageRoute(
        builder: (context) => const OrderView(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
