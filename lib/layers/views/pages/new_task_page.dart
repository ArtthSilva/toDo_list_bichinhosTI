import 'package:flutter/material.dart';
import 'package:todo_list/widgets/leading_custom_widget.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const Text(
                'Nova tarefa',
                style: TextStyle(color: Colors.transparent),
              )
            ],
          ),
        ),
      ),
    );
  }
}
