import 'package:flutter/material.dart';
 
class TasksCustomWidget extends StatefulWidget {
  const TasksCustomWidget({super.key, required this.urlImage, required this.urlTitle, required this.urlDate, required this.urlHour});
  final String urlImage;
  final String urlTitle;
  final String urlDate;
  final String urlHour;

  @override
  State<TasksCustomWidget> createState() => _TasksCustomWidgetState();
}

class _TasksCustomWidgetState extends State<TasksCustomWidget> {
  @override
  Widget build(BuildContext context) {
      bool? isChecked = false;

    return Container(
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10)        
      ),
      width: MediaQuery.sizeOf(context).width * 0.80,
      child: Row(
        children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Image.asset('assets/images/${widget.urlImage}.png'),
         ),
         Column(
         children: [
          Text(widget.urlTitle),
           Text('${widget.urlDate} - às ${widget.urlHour}')
           ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:40.0),
            child: Checkbox(
              tristate: true,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
          ),
        ],
        ),
    );
  }
}