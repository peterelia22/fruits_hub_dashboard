import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File imageFile;
  final bool isFeatured;
  String? imageUrl;

  AddProductInputEntity(
      {required this.name,
      this.imageUrl,
      required this.code,
      required this.description,
      required this.price,
      required this.imageFile,
      required this.isFeatured});
}
