import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
   const CustomTextFormFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'campo não preenchido';
        } else if (value == '0') {
          return 'o numero 0 não é positivo, ele é neutro';
        }
        return null;
      },
      decoration: const InputDecoration(
        
          border: OutlineInputBorder(
          ), labelText: 'Título da tarefa'),
      
    );
  }
}