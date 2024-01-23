import 'package:flutter/material.dart';

class PersonModel {
  final String title;
  final int category;
  final DateTime date;
  final HourFormat hour;
  final String annotation;

  PersonModel(
      {required this.title,
      required this.category,
      required this.date,
      required this.hour,
      required this.annotation});
}
