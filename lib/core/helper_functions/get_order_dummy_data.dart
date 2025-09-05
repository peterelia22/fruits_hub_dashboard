import 'dart:math';

import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

// Method to create a sample order with all data
OrderEntity createSampleOrder() {
  // Create sample shipping address
  final shippingAddress = ShippingAddressEntity(
    name: 'John Smith',
    address: '123 Main Street',
    city: 'New York',
    email: 'john.smith@email.com',
    addressDetails: 'Apartment 4B',
    phoneNumber: '+1 (555) 123-4567',
  );

  // Create sample products
  final orderProducts = [
    OrderProductEntity(
      name: 'Fresh Red Apples',
      code: 'APPLE001',
      imageUrl:
          'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=300',
      price: 4.99,
      quantity: 3,
    ),
    OrderProductEntity(
      name: 'Organic Bananas',
      code: 'BANANA002',
      imageUrl:
          'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=300',
      price: 2.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'Fresh Orange Juice',
      code: 'JUICE003',
      imageUrl:
          'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=300',
      price: 6.50,
      quantity: 1,
    ),
  ];

  // Calculate total price
  double totalPrice = 0.0;
  for (var product in orderProducts) {
    totalPrice += product.price * product.quantity;
  }
  // Add shipping cost
  totalPrice += 5.99;

  // Create and return the order
  return OrderEntity(
    status: OrderEnum.pending,
    totalPrice: totalPrice,
    uID: 'USER${Random().nextInt(999999).toString().padLeft(6, '0')}',
    shippingAddressEntity: shippingAddress,
    orderProducts: orderProducts,
    paymentMethod: 'Cash',
  );
}

// Method to create multiple sample orders
List<OrderEntity> createMultipleSampleOrders(int count) {
  final List<OrderEntity> orders = [];
  final random = Random();

  final sampleNames = [
    'John Smith',
    'Jane Doe',
    'Mike Johnson',
    'Sarah Wilson',
    'David Brown'
  ];

  final sampleAddresses = [
    '123 Main Street',
    '456 Oak Avenue',
    '789 Pine Road',
    '321 Elm Drive',
    '654 Maple Lane'
  ];

  final sampleCities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix'
  ];

  final sampleProducts = [
    {
      'name': 'Fresh Red Apples',
      'code': 'APPLE001',
      'image':
          'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=300',
      'price': 4.99
    },
    {
      'name': 'Organic Bananas',
      'code': 'BANANA002',
      'image':
          'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=300',
      'price': 2.99
    },
    {
      'name': 'Fresh Orange Juice',
      'code': 'JUICE003',
      'image':
          'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=300',
      'price': 6.50
    },
    {
      'name': 'Green Grapes',
      'code': 'GRAPE004',
      'image':
          'https://images.unsplash.com/photo-1537640538966-79f369143715?w=300',
      'price': 5.99
    },
    {
      'name': 'Fresh Strawberries',
      'code': 'BERRY005',
      'image':
          'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=300',
      'price': 7.99
    },
    {
      'name': 'Ripe Mangoes',
      'code': 'MANGO006',
      'image':
          'https://images.unsplash.com/photo-1605027990121-cbae9202176a?w=300',
      'price': 8.50
    },
    {
      'name': 'Fresh Pineapple',
      'code': 'PINE007',
      'image':
          'https://images.unsplash.com/photo-1550258987-190a2d41a8ba?w=300',
      'price': 4.25
    },
    {
      'name': 'Organic Blueberries',
      'code': 'BLUE008',
      'image':
          'https://images.unsplash.com/photo-1498557850523-fd3d118b962e?w=300',
      'price': 9.99
    },
  ];

  final paymentMethods = ['Cash', 'Paypal'];

  for (int i = 0; i < count; i++) {
    // Random shipping address
    final shippingAddress = ShippingAddressEntity(
      name: sampleNames[random.nextInt(sampleNames.length)],
      address: sampleAddresses[random.nextInt(sampleAddresses.length)],
      city: sampleCities[random.nextInt(sampleCities.length)],
      email:
          '${sampleNames[random.nextInt(sampleNames.length)].toLowerCase().replaceAll(' ', '.')}@email.com',
      addressDetails: 'Apartment ${random.nextInt(20) + 1}${[
        'A',
        'B',
        'C'
      ][random.nextInt(3)]}',
      phoneNumber:
          '+1 (${random.nextInt(900) + 100}) ${random.nextInt(900) + 100}-${random.nextInt(9000) + 1000}',
    );

    // Random products (2-5 products per order)
    final numberOfProducts = random.nextInt(4) + 2;
    final selectedProducts = <OrderProductEntity>[];
    final usedProducts = <int>[];

    for (int j = 0; j < numberOfProducts; j++) {
      int productIndex;
      do {
        productIndex = random.nextInt(sampleProducts.length);
      } while (usedProducts.contains(productIndex));

      usedProducts.add(productIndex);
      final product = sampleProducts[productIndex];

      selectedProducts.add(
        OrderProductEntity(
          name: product['name'] as String,
          code: product['code'] as String,
          imageUrl: product['image'] as String,
          price: product['price'] as double,
          quantity: random.nextInt(3) + 1,
        ),
      );
    }

    // Calculate total price
    double totalPrice = 0.0;
    for (var product in selectedProducts) {
      totalPrice += product.price * product.quantity;
    }
    // Add random shipping cost
    totalPrice += [3.99, 5.99, 7.99][random.nextInt(3)];

    orders.add(
      OrderEntity(
        status: OrderEnum.pending,
        totalPrice: totalPrice,
        uID: 'USER${random.nextInt(999999).toString().padLeft(6, '0')}',
        shippingAddressEntity: shippingAddress,
        orderProducts: selectedProducts,
        paymentMethod: paymentMethods[random.nextInt(paymentMethods.length)],
      ),
    );
  }

  return orders;
}

// Method to create an empty order template
OrderEntity createEmptyOrder() {
  return OrderEntity(
    status: OrderEnum.pending,
    totalPrice: 0.0,
    uID: '',
    shippingAddressEntity: ShippingAddressEntity(
      name: null,
      address: null,
      city: null,
      email: null,
      addressDetails: null,
      phoneNumber: null,
    ),
    orderProducts: [],
    paymentMethod: 'Cash',
  );
}

// Method to create order with custom data
OrderEntity createCustomOrder({
  required double totalPrice,
  required String userID,
  required String customerName,
  required String address,
  required String city,
  String? email,
  String? phone,
  String? addressDetails,
  required List<Map<String, dynamic>> products,
  required String paymentMethod,
}) {
  final shippingAddress = ShippingAddressEntity(
    name: customerName,
    address: address,
    city: city,
    email: email,
    addressDetails: addressDetails,
    phoneNumber: phone,
  );

  final orderProducts = products
      .map(
        (product) => OrderProductEntity(
          name: product['name'] ?? 'Unknown Product',
          code: product['code'] ?? 'UNKNOWN',
          imageUrl: product['imageUrl'] ?? '',
          price: (product['price'] ?? 0.0).toDouble(),
          quantity: product['quantity'] ?? 1,
        ),
      )
      .toList();

  return OrderEntity(
    status: OrderEnum.pending,
    totalPrice: totalPrice,
    uID: userID,
    shippingAddressEntity: shippingAddress,
    orderProducts: orderProducts,
    paymentMethod: paymentMethod,
  );
}

// Method to create a quick test order

OrderEntity createQuickTestOrder() {
  return OrderEntity(
    status: OrderEnum.pending,
    totalPrice: 29.99,
    uID: 'TESTUSER001',
    shippingAddressEntity: ShippingAddressEntity(
      name: 'Test Customer',
      address: '123 Test Street',
      city: 'Test City',
      email: 'test@example.com',
      addressDetails: 'Test Floor 1',
      phoneNumber: '+1-555-TEST',
    ),
    orderProducts: [
      OrderProductEntity(
        name: 'Test Apple',
        code: 'TEST001',
        imageUrl: 'https://via.placeholder.com/150',
        price: 9.99,
        quantity: 1,
      ),
      OrderProductEntity(
        name: 'Test Orange',
        code: 'TEST002',
        imageUrl: 'https://via.placeholder.com/150',
        price: 19.99,
        quantity: 1,
      ),
    ],
    paymentMethod: 'Cash',
  );
}
