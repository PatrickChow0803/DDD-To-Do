import 'package:ddd_to_do/presentation/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.teal[800],
          // this creates the border around TextInputFields. Ex: The email and password
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)))),
    );
  }
}
