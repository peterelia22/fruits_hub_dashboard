import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileSelected});
  final ValueChanged<File?> onFileSelected;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isImageLoading = false;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isImageLoading,
      child: GestureDetector(
        onTap: () async {
          isImageLoading = true;
          setState(() {});
          try {
            await pickImage();
          } on Exception catch (e) {}
          isImageLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child: imageFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16),
                      child: Image.file(imageFile!))
                  : const Icon(
                      Icons.image_outlined,
                      size: 180,
                    ),
            ),
            Visibility(
              visible: imageFile != null,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      imageFile = null;
                      widget.onFileSelected(null);
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    widget.onFileSelected(imageFile!);
  }
}
