import 'dart:io';

import 'review_entity.dart';

class ProductsEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File imageFile;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numOfCalories;
  final int gramAmount;
  final num avgRating = 0;
  final num numOfRatings = 0;
  final List<ReviewEntity> reviews;
  ProductsEntity(
      {required this.name,
      this.imageUrl,
      required this.code,
      required this.expirationMonths,
      required this.numOfCalories,
      required this.gramAmount,
      required this.description,
      required this.reviews,
      required this.price,
      required this.imageFile,
      this.isOrganic = false,
      required this.isFeatured});
}
