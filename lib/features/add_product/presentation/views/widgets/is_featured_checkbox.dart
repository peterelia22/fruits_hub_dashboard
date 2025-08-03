import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart'
    show CustomCheckBox;

class isFeaturedCheckBox extends StatefulWidget {
  const isFeaturedCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<isFeaturedCheckBox> createState() => _isFeaturedCheckBoxState();
}

class _isFeaturedCheckBoxState extends State<isFeaturedCheckBox> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'Is this product featured?',
                  style: TextStyles.semiBold13
                      .copyWith(color: const Color(0xFF949D9E))),
            ],
          ),
          textAlign: TextAlign.right,
        ),
        const Expanded(
          child: SizedBox(
            width: 16,
          ),
        ),
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
      ],
    );
  }
}
