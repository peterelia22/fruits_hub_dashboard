import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order/update_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateOrderBlocBuilder extends StatelessWidget {
  const UpdateOrderBlocBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        if (state is UpdateOrderSucess) {
          buildSnackBar(context, 'Order Updated Successfully');
        }
        if (state is UpdateOrderFailure) {
          buildSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is UpdateOrderLoading, child: child);
      },
    );
  }
}
