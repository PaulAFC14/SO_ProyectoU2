import 'package:flutter/material.dart';
import 'package:proyecto/src/reusable/thread.dart';
import 'package:proyecto/src/screens/home_page.dart';
import 'package:proyecto/src/screens/m1.dart';
import 'package:proyecto/src/screens/m2.dart';
import 'package:proyecto/src/screens/m3.dart';

class Routes {
  goToHP(BuildContext context, List<Thread> threads) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: ((context) => HomePage(init_threads: threads))));
  }

  goToM1(BuildContext context, List<Thread> threads) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => M1(threads: threads))));
  }

  goToM2(BuildContext context, List<Thread> threads) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => M2(threads: threads))));
  }

  goToM3(BuildContext context, List<Thread> threads) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => M3(threads: threads))));
  }
}
