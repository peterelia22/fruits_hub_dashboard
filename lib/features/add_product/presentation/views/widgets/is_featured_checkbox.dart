import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart'
    show CustomCheckBox;

class isCheckBox extends StatefulWidget {
  const isCheckBox({super.key, required this.onChanged, required this.text});
  final ValueChanged<bool> onChanged;
  final String text;
  @override
  State<isCheckBox> createState() => _isCheckBoxState();
}

class _isCheckBoxState extends State<isCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: widget.text,
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
          isChecked: isChecked,
          onChecked: (value) {
            isChecked = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
      ],
    );
  }
}
