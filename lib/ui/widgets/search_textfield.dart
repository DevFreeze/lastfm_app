import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../theme/decoration.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final VoidCallback onSuffixIconPressed;
  final VoidCallback onEditingComplete;
  final Function(String) onTextChanged;

  const SearchTextField({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.onSuffixIconPressed,
    required this.onEditingComplete,
    required this.onTextChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 12,
          top: 20,
        ),
        child: SizedBox(
          height: 45,
          width: 300,
          child: TextFormField(
            focusNode: focusNode,
            controller: textEditingController,
            decoration: textInputDecoration.copyWith(
              contentPadding: const EdgeInsets.only(
                left: 15,
                right: 10,
                top: 10,
                bottom: 10,
              ),
              hintText: tr('search'),
              hintStyle: TextStyle(
                color: Color(0xFFE5E5E5),
              ),
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: onSuffixIconPressed,
                icon: Icon(Icons.clear),
              ),
            ),
            onChanged: onTextChanged,
            onEditingComplete: onEditingComplete,
          ),
        ),
      ),
    );
  }
}
