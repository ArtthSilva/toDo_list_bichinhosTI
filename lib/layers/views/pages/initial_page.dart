import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/layers/controllers/todo_controller.dart';
import 'package:todo_list/layers/database/sqflite_db.dart';
import 'package:todo_list/layers/views/pages/new_task_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  TodoController controller = TodoController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
    controller.loadTasks();
  }

  final String dataFormatada =
      DateFormat('LLLL, d, y', 'pt_BR').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.lightBlue,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(dataFormatada,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              Text(
                                'FlutterPad',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Todo List',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Align(
                alignment: const Alignment(0, -0.30),
                child: ListView.builder(
                    itemCount: controller.tasks.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5))),
                        child: Row(
                          children: [
                            SizedBox(width: MediaQuery.sizeOf(context).width * 0.015,),
                            Image.asset('assets/images/${controller.tasks[index].category}.png'),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.75,
                              height: MediaQuery.sizeOf(context).height * 0.1,
                              child: AnimatedBuilder(
                                animation: controller,
                                builder: (_, __) => CheckboxListTile(
                                  title: Text(
                                    controller.tasks[index].title,
                                    style: TextStyle(
                                      decoration: controller.tasks[index].completed ==  1 ? TextDecoration.lineThrough : null ,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                      '${controller.tasks[index].date} - às ${controller.tasks[index].hour}',
                                      style: TextStyle(
                                         decoration: controller.tasks[index].completed ==  1 ? TextDecoration.lineThrough : null ,
                                      ),
                                      ),
                                  value: isCompleted(controller.tasks[index].completed),
                            
                                  onChanged: (newValue) {                            
                                  int newStatus = newValue! ? 1 : 0;
                                  controller.tasks[index].completed = newStatus;
                                  SqfliteDB.updateTask(index + 1, controller.tasks[index]);
                                      setState(() {});                       
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NewTaskPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Nova tarefa',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  isCompleted(int valor) {
    if (valor == 0) {
      return false;
    } else {
      return true;
    }
  }
}
