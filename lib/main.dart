import 'package:flutter/material.dart';
import 'package:shopping_application/shared/network/remote/dio_helper.dart';
import 'package:shopping_application/shared/themes.dart';

import 'modules/on_boarding/on_boarding_screen.dart';

void main() {

  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}

