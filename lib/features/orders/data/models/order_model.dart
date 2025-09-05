import 'dart:math';

import 'order_product_model.dart';
import 'shipping_address_model.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
      required this.uID,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});
  toJson() {
    return {
      'totalPrice': totalPrice,
      'uID': uID,
      'status': 'pending',
      'dateTime': DateTime.now().toString(),
      'shippingAddress': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'],
      uID: json['uID'],
      shippingAddressModel: ShippingAddressModel.fromJson(
        json['shippingAddress'] as Map<String, dynamic>,
      ),
      orderProducts: (json['orderProducts'])
          .map((e) => OrderProductModel.fromJson(e))
          .toList(),
      paymentMethod: json['paymentMethod'],
    );
  }
}
