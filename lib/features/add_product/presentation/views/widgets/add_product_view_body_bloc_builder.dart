import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/csutom_progress_hud.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';

import '../../../../../core/helper_functions/build_error_bar.dart';
import 'add_product_view_body.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailure) {
          buildSnackBar(context, state.message);
        }
        if (state is AddProductSuccess) {
          Navigator.pop(context);
          buildSnackBar(context, 'Product added successfully');
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is AddProductLoading,
            child: const AddProductViewBody());
      },
    );
  }
}
