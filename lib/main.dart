import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_list/layers/views/pages/initial_page.dart';

void main() {
   runApp(
    const MaterialApp(home: InitialPage(),
  localizationsDelegates:  [
    GlobalMaterialLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate
  ],
  supportedLocales: [
    Locale('pt', 'BR')
  ],
  debugShowCheckedModeBanner: false,
   ));
}