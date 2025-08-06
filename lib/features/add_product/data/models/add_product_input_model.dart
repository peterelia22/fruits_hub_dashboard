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
  final int expirationMonths;
  bool isOrganic;
  final int numOfCalories;
  final int gramAmount;
  final num avgRating = 0;
  final num numOfRatings = 0;
  AddProductInputModel(
      {required this.name,
      this.imageUrl,
      required this.code,
      required this.description,
      required this.expirationMonths,
      required this.numOfCalories,
      required this.gramAmount,
      required this.price,
      required this.imageFile,
      required this.isFeatured,
      required this.isOrganic});
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
      expirationMonths: addProductInputEntity.expirationMonths,
      numOfCalories: addProductInputEntity.numOfCalories,
      gramAmount: addProductInputEntity.gramAmount,
      isOrganic: addProductInputEntity.isOrganic,
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
      'expirationMonths': expirationMonths,
      'numOfCalories': numOfCalories,
      'gramAmount': gramAmount,
      'isOrganic': isOrganic,
    };
  }
}
