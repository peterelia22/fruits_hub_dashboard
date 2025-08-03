import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
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
                const CustomTextFormField(
                    hintText: 'Product Name', keyboardType: TextInputType.text),
                const SizedBox(
                  height: 16,
                ),
                const CustomTextFormField(
                    hintText: 'Product Price',
                    keyboardType: TextInputType.number),
                const SizedBox(
                  height: 16,
                ),
                const CustomTextFormField(
                    hintText: 'Product Code',
                    keyboardType: TextInputType.number),
                const SizedBox(
                  height: 16,
                ),
                const CustomTextFormField(
                  hintText: 'Product Description',
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 16,
                ),
                ImageField(
                  onFileSelected: (image) {},
                )
              ],
            )),
      ),
    );
  }
}
