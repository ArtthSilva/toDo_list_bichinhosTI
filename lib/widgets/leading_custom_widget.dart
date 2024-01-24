// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LeadingCustomWidget extends StatefulWidget {

 const LeadingCustomWidget({ Key? key}) : super(key: key);
 
  @override
  State<LeadingCustomWidget> createState() => _LeadingCustomWidgetState();
}

class _LeadingCustomWidgetState extends State<LeadingCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
        width: MediaQuery.sizeOf(context).width * 0.14,
        height: MediaQuery.sizeOf(context).height * 0.07,
      decoration:BoxDecoration(
              color: Colors.white,  
              borderRadius: BorderRadius.circular(50.0),  
            ),
      child: const Icon(Icons.close),
    );
  }
}
