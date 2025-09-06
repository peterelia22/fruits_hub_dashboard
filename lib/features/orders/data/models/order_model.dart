import 'dart:math';

import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

import '../../../../core/enums/order_enum.dart';
import 'order_product_model.dart';
import 'shipping_address_model.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String? status;
  OrderModel(
      {required this.totalPrice,
      required this.uID,
      required this.shippingAddressModel,
      required this.status,
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
      status: json['status'],
      totalPrice: json['totalPrice'],
      uID: json['uID'],
      shippingAddressModel: ShippingAddressModel.fromJson(
        json['shippingAddress'] as Map<String, dynamic>,
      ),
      orderProducts: List<OrderProductModel>.from(
        json['orderProducts'].map(
          (e) => OrderProductModel.fromJson(e),
        ),
      ),
      paymentMethod: json['paymentMethod'],
    );
  }
  toEntity() {
    return OrderEntity(
        status: fetchEnum(),
        totalPrice: totalPrice,
        uID: uID,
        shippingAddressEntity: shippingAddressModel.toEntity(),
        orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
        paymentMethod: paymentMethod);
  }

  OrderStatusEnum fetchEnum() {
    return OrderStatusEnum.values.firstWhere((e) {
      var enumStatus = e.name.toString();
      return enumStatus == (status ?? 'pending');
    });
  }
}
