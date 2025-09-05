import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entites/products_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_checkbox.dart';

import '../../manager/cubit/add_product_cubit.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  late String name, code, description;
  late num price, expirationMonths, numOfCalories, gramAmount;
  File? imageFile;
  bool isFeatured = false;
  bool isOrganic = false;
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
                    expirationMonths = num.parse(value!);
                  },
                  hintText: 'Expiration Months',
                  keyboardType: TextInputType.number),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    numOfCalories = num.parse(value!);
                  },
                  hintText: 'Number of Calories',
                  keyboardType: TextInputType.number),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    gramAmount = num.parse(value!);
                  },
                  hintText: 'Gram Amount',
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
              isCheckBox(
                  text: 'Is this product featured?',
                  onChanged: (value) {
                    isFeatured = value;
                  }),
              const SizedBox(
                height: 16,
              ),
              isCheckBox(
                  text: 'Is this product Organic?',
                  onChanged: (value) {
                    isOrganic = value;
                  }),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                  onPressed: () {
                    if (imageFile != null) {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        ProductsEntity inputEntity = ProductsEntity(
                            name: name,
                            code: code,
                            description: description,
                            price: price,
                            imageFile: imageFile!,
                            isFeatured: isFeatured,
                            expirationMonths: expirationMonths.toInt(),
                            numOfCalories: numOfCalories.toInt(),
                            gramAmount: gramAmount.toInt(),
                            isOrganic: isOrganic,
                            reviews: []);
                        context.read<AddProductCubit>().addProduct(inputEntity);
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
