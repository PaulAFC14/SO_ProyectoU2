import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proyecto/src/reusable/graphics.dart';
import 'package:proyecto/src/reusable/routes.dart';
import 'package:proyecto/src/reusable/thread.dart';

class M2 extends StatefulWidget {
  late List<Thread> threads;

  M2({Key? key, required this.threads});

  @override
  State<M2> createState() => _M2State(threads);
}

class _M2State extends State<M2> {
  late List<Thread> threads;
  late List<Thread> exe = [];
  _M2State(this.threads);

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

    //Criterio de ordenación para llegadas iguales en base a su costo
    for (int i = 1; i < threads.length; i++) {
      if (threads[i].getArrival() == threads[i - 1].getArrival()) {
        if (threads[i].getQuantums() < threads[i - 1].getQuantums()) {
          aux = threads[i];
          threads[i] = threads[i - 1];
          threads[i - 1] = aux;
          i = 0;
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

    opcion1();

    //Recalculo de valores
    tej = 0;
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

  opcion2() {
    Thread aux;
    List<Thread> copy = [];
    copy.add(threads[0]);
    do {
      List<Thread> paused = [];

      for (int i = copy.length; i < threads.length; i++) {
        if (threads[i].getArrival() <
            (copy[copy.length - 1].getTP() +
                copy[copy.length - 1].getArrival())) {
          paused.add(threads[i]);
        }
      }

      if (paused.length > 1) {
        for (int i = 0; i <= paused.length - 2; i++) {
          for (int j = 0; j <= paused.length - i - 2; j++) {
            if ((paused[j].getPri()) > (paused[j + 1].getPri())) {
              aux = paused[j];
              paused[j] = paused[j + 1];
              paused[j + 1] = aux;
            }
          }
        }

        for (int i = 0; i < paused.length; i++) {
          copy.add(paused[i]);
        }
      } else {
        copy.add(threads[copy.length]);
      }

      for (int i = 0; i < copy.length; i++) {}
    } while (copy.length < threads.length);

    for (int i = 0; i < copy.length; i++) {
      copy[i].setTE(0);
      copy[i].setTR(0);
      copy[i].setTP(0);
    }

    threads = copy;
  }

  opcion1() {
    Thread aux;
    List<Thread> copy = [];
    copy.add(threads[0]);
    do {
      List<Thread> paused = [];

      for (int i = copy.length; i < threads.length; i++) {
        if (threads[i].getArrival() <
            (copy[copy.length - 1].getTP() +
                copy[copy.length - 1].getArrival())) {
          paused.add(threads[i]);
        }
      }

      if (paused.length > 1) {
        for (int i = 0; i <= paused.length - 2; i++) {
          for (int j = 0; j <= paused.length - i - 2; j++) {
            if ((paused[j].getPri()) > (paused[j + 1].getPri())) {
              aux = paused[j];
              paused[j] = paused[j + 1];
              paused[j + 1] = aux;
            }
          }
        }

        for (int i = 0; i < paused.length; i++) {
          copy.add(paused[i]);
        }
      } else {
        copy.add(threads[copy.length]);
      }

      for (int i = 0; i < copy.length; i++) {}
    } while (copy.length < threads.length);

    for (int i = 0; i < copy.length; i++) {
      copy[i].setTE(0);
      copy[i].setTR(0);
      copy[i].setTP(0);
    }

    threads = copy;
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
          'Shortest Job First',
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

  bool isSuspended(int range, int check) {
    if (range >= check) {
      return true;
    } else {
      return false;
    }
  }
}
