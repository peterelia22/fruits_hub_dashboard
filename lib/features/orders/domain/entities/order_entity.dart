import 'dart:math';

import 'order_product_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uID;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;

  OrderEntity(
      {required this.totalPrice,
      required this.uID,
      required this.shippingAddressEntity,
      required this.orderProducts,
      required this.paymentMethod});
}
