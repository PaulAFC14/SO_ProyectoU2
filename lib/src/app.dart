import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proyecto/src/screens/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planificación de procesos',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 241, 244, 244),
          backgroundColor: Color.fromARGB(255, 233, 233, 233),
          primaryColor: Color.fromARGB(255, 10, 26, 55),
          canvasColor: Color.fromARGB(255, 12, 76, 128)),
      initialRoute: '/',
      routes: {
        "/": (BuildContext context) => HomePage(
              init_threads: [],
            ),
      },
    );
  }
}
