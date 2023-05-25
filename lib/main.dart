import 'package:calendar_task/di/Bindings.dart';
import 'package:calendar_task/main/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async {
  AppBindings.setUpDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return const App();
  }
}



