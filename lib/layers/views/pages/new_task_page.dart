import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/layers/controllers/todo_controller.dart';
import 'package:todo_list/layers/models/task_model.dart';
import 'package:todo_list/widgets/leading_custom_widget.dart';
import 'package:todo_list/widgets/textformfield_custom_widget.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final _titleTaskController = TextEditingController();
  final _anotationController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
final TodoController controller = TodoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
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
                margin: const EdgeInsets.only(left: 20, top: 15),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Título',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: CustomTextFormFieldWidget(
                            numberMaxLines: 1,
                            textLabel: 'Título da tarefa',
                            controller: _titleTaskController),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(left: 10, top: 15),
                        child: Row(
                          children: [
                            const Text(
                              'Categoria',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                         AnimatedBuilder(
                        animation: controller,
                        builder: (__,_) => GestureDetector(
                          onTap: () => controller.pickCategory('file'),
                          child: CircleAvatar(
                            radius: 31,
                            backgroundColor: controller.category.value == 'file'
                                ? Colors.black
                                : Colors.transparent,
                            child: const CircleAvatar(
                              radius: 28,
                              backgroundImage:
                                  AssetImage('assets/images/file.png'),
                            ),
                          ),
                        ),
                      ),
                         AnimatedBuilder(
                        animation: controller,
                        builder: (__,_) => GestureDetector(
                          onTap: () => controller.pickCategory('calendar'),
                          child: CircleAvatar(
                            radius: 31,
                            backgroundColor: controller.category.value == 'calendar'
                                ? Colors.black
                                : Colors.transparent,
                            child: const CircleAvatar(
                              radius: 28,
                              backgroundImage:
                                  AssetImage('assets/images/calendar.png'),
                            ),
                          ),
                        ),
                      ),
                         AnimatedBuilder(
                        animation: controller,
                        builder: (__,_) => GestureDetector(
                          onTap: () => controller.pickCategory('trophy'),
                          child: CircleAvatar(
                            radius: 31,
                            backgroundColor: controller.category.value == 'trophy'
                                ? Colors.black
                                : Colors.transparent,
                            child: const CircleAvatar(
                              radius: 28,
                              backgroundImage:
                                  AssetImage('assets/images/trophy.png'),
                            ),
                          ),
                        ),
                      ),
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2.3,
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: MediaQuery.sizeOf(context).width /
                                          2.4,
                                      child: const Text(
                                        'Data',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(
                                    child: TextField(
                                        controller: _dateController,
                                        decoration: const InputDecoration(
                                            hintText: 'Data',
                                            filled: true,
                                            prefixIcon:
                                                Icon(Icons.calendar_today),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none)),
                                        readOnly: true,
                                        onTap: () => _selectDate()),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, top: 10),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2.3,
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: MediaQuery.sizeOf(context).width /
                                          2.4,
                                      child: const Text(
                                        'Hora',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  TextField(
                                      controller: _timeController,
                                      decoration: const InputDecoration(
                                          hintText: 'Hora',
                                          filled: true,
                                          prefixIcon: Icon(Icons.access_time),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                      readOnly: true,
                                      onTap: () => _selectTime(context))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 10, top: 10, bottom: 10),
                            child: Text(
                              'Anotação',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: CustomTextFormFieldWidget(
                          numberMaxLines: 5,
                          textLabel: 'Anotação',
                          controller: _anotationController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.911,
          child: FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              TaskModel task = TaskModel(
                  title: _titleTaskController.text,
                  category: controller.category.value,
                  date: _dateController.text,
                  hour: _timeController.text,
                  annotation: _anotationController.text,
                  completed: 0
                   );
                controller.saveTask(task);
                 print(task.title);
                 print(task.completed);
            },
            child: const Text(
              'Salvar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      _dateController.text = DateFormat('dd/MM/yyyy', 'pt_BR').format(picked);
    }
  }

  final _selectedTime = TimeOfDay.now();
  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _timeController.text =
            "${picked.hour}:${picked.minute.toString().padLeft(2, '0')}";
      });
    }
  }
}
