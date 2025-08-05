import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entites/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File imageFile;
  final bool isFeatured;
  String? imageUrl;

  AddProductInputModel(
      {required this.name,
      this.imageUrl,
      required this.code,
      required this.description,
      required this.price,
      required this.imageFile,
      required this.isFeatured});
  factory AddProductInputModel.fromEntity(
      AddProductInputEntity addProductInputEntity) {
    return AddProductInputModel(
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      imageFile: addProductInputEntity.imageFile,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
    );
  }
  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
    };
  }
}
