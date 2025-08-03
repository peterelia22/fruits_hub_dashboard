import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_checkbox.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  late String name, code, description;
  late num price;
  File? imageFile;
  bool isFeatured = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: 'Product Name',
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    price = num.parse(value!);
                  },
                  hintText: 'Product Price',
                  keyboardType: TextInputType.number),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    code = value!.toLowerCase();
                  },
                  hintText: 'Product Code',
                  keyboardType: TextInputType.number),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'Product Description',
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              ImageField(
                onFileSelected: (image) {
                  imageFile = image!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              isFeaturedCheckBox(onChanged: (value) {
                isFeatured = value;
              }),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                  onPressed: () {
                    if (imageFile != null) {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    } else {
                      showError(context);
                    }
                  },
                  text: 'Add Product'),
              const SizedBox(
                height: 24,
              )
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select an image for the product.'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
