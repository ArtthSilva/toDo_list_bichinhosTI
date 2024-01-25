import 'package:flutter/material.dart';
import 'package:todo_list/layers/controllers/todo_controller.dart';

// ignore: must_be_immutable
class CategoryButtonCustom extends StatelessWidget {
    String imageUrl;

  CategoryButtonCustom({
    super.key,
    required this.imageUrl
  });
TodoController controller = TodoController();



  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => InkWell(
        onTap: () => controller.escolher(),
        child: CircleAvatar(
          radius: 31,
          backgroundColor:
              controller.isSelected.value ? Colors.black : Colors.transparent,
          child: CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(imageUrl),
          ),
        ),
      ),
    );
  }
}



