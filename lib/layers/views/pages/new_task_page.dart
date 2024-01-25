import 'package:flutter/material.dart';
import 'package:todo_list/widgets/category_button_custom_widget.dart';
import 'package:todo_list/widgets/leading_custom_widget.dart';
import 'package:todo_list/widgets/textformfield_custom_widget.dart';

class NewTaskPage extends StatefulWidget {
  NewTaskPage({super.key});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.lightBlue,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.12,
              child: Row(
                children: [
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const LeadingCustomWidget()),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Nova tarefa',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.14 + 20,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Título',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            Form(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: Column(
                children: [
                  CustomTextFormFieldWidget(controller: _controller),
                  Padding(
                    padding: const EdgeInsets.only(left:5, top: 15),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right:8.0),
                          child: Text('Categoria', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        CategoryButtonCustom(imageUrl: 'assets/images/file.png'),
                        CategoryButtonCustom(imageUrl: 'assets/images/calendar.png'),
                        CategoryButtonCustom(imageUrl: 'assets/images/trophy.png'),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
