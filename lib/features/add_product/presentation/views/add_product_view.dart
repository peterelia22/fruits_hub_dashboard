import 'package:flutter/material.dart';

import '../../../../core/widgets/build_app_bar.dart';
import 'widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add-product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Product'),
      body: const AddProductViewBody(),
    );
  }
}
