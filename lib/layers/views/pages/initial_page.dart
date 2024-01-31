import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/layers/controllers/todo_controller.dart';
import 'package:todo_list/layers/views/pages/new_task_page.dart';
import 'package:todo_list/widgets/tasks_custom_widget.dart';

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
    controller.loadTasks();
  }

  final String dataFormatada =
      DateFormat('LLLL, d, y', 'pt_BR').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
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
            Align(
              alignment: Alignment(0, -0.35),
              child: ListView.builder(
                    itemCount: controller.tasks.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),                   
                    itemBuilder:(context, index){
                      return Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.10,
                          ),
                          TasksCustomWidget(
                            urlImage: controller.tasks[index].category,
                            urlTitle: controller.tasks[index].title, 
                            urlDate: controller.tasks[index].date, 
                            urlHour: controller.tasks[index].hour),
                        ],
                      );
                    } ),
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
}
