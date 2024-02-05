// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String textLabel;
  final int numberMaxLines;
  const CustomTextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.textLabel,
    required this.numberMaxLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(      
      maxLines: numberMaxLines,
      controller: controller,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'campo não preenchido';
        } 
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: textLabel,
        filled: true,
        fillColor: Colors.white
         ),
      
    );
  }
}
