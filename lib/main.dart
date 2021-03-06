import 'package:ddd_to_do/injection.dart';
import 'package:ddd_to_do/presentation/core/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  // Use this when main method is async
  WidgetsFlutterBinding.ensureInitialized();
  // This invokes the generated initGetIt
  configureInjection(Environment.prod);
  await Firebase.initializeApp();
  runApp(AppWidget());
}
