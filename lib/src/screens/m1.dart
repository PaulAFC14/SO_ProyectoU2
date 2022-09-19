import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proyecto/src/reusable/graphics.dart';
import 'package:proyecto/src/reusable/routes.dart';
import 'package:proyecto/src/reusable/thread.dart';

class M1 extends StatefulWidget {
  late List<Thread> threads;

  M1({Key? key, required this.threads});

  @override
  State<M1> createState() => _M1State(threads);
}

class _M1State extends State<M1> {
  late List<Thread> threads;
  _M1State(this.threads);

  runMethod() {
    Thread aux;

    //Orden de ejecución en base a su llegada
    for (int i = 0; i <= threads.length - 2; i++) {
      for (int j = 0; j <= threads.length - i - 2; j++) {
        if ((threads[j].getArrival()) > (threads[j + 1].getArrival())) {
          aux = threads[j];
          threads[j] = threads[j + 1];
          threads[j + 1] = aux;
        }
      }
    }

    //Calculo de valores
    int tej = 0;
    for (int i = 0; i < threads.length; i++) {
      if (i == 0) {
        threads[i].setTE(0);
        threads[i].setTR(threads[i].getQuantums());
        threads[i].setTP(threads[i].getQuantums());
        tej += threads[i].getQuantums();
      } else {
        threads[i].setTE(tej - threads[i].getArrival());
        threads[i].setTR(threads[i].getQuantums() + threads[i - 1].getTR());
        threads[i].setTP(threads[i].getTE() + threads[i].getQuantums());
        tej += threads[i].getQuantums();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    runMethod();
    double wd = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Routes().goToHP(context, threads),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).primaryColor,
            )),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          'First Come First Served',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(60)),
                padding: EdgeInsets.symmetric(vertical: 8),
                width: wd = wd - 40,
                height: 48,
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: Graphics()
                      .buildTimeLine(context: context, threads: threads),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: Graphics().buildTable(context, threads: threads),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Graphics().BuildThreadsGrid(
                    context: context, threads: threads, wd: wd),
              )
            ],
          )
        ],
      ),
    );
  }
}
