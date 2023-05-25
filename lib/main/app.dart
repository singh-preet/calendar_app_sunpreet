import 'package:calendar_task/features/calendar/calendar_screen.dart';
import 'package:calendar_task/utils/app_constants.dart';
import 'package:calendar_task/utils/color_utils.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: AppColor.sunColor,
      ),
      home: CalendarScreen(),
    );
  }
}

