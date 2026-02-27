import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_field.dart';

class HomeSearchBarWidget extends StatelessWidget {
  final VoidCallback onCancel;
  final ValueChanged<String>? onChanged;

  const HomeSearchBarWidget({
    super.key,
    required this.onCancel,  this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              onChange: onChanged,
              hintText: 'Search', isObscure: false, readOnly: false,
              suffixIcon: GestureDetector(
                onTap: onCancel,
                child: const Icon(Icons.close, size: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}