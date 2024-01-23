import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final String dataFormatada =
      DateFormat('LLLL, d, y', 'pt_BR').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: Colors.lightBlue,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children:  [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(dataFormatada,
                      style: const TextStyle(color: Colors.white, fontSize: 16)),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Text(
                          'FlutterPad',
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Todo List',
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
