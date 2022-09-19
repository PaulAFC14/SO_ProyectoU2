import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/src/reusable/routes.dart';
import 'package:proyecto/src/reusable/thread.dart';

class Graphics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  Widget BuildThreadsGrid(
      {required BuildContext context,
      required List<Thread> threads,
      required double wd}) {
    int width = 0;
    if (wd > 500) {
      width = 7;
    } else {
      width = 4;
    }

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: threads.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onLongPress: (() => deleteItem(context, index, threads)), //BORRADOR
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: threads[index].getColor(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${threads[index].getArrival()}',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    '${threads[index].getQuantums()}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '${threads[index].getPri()}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  deleteItem(BuildContext context, int index, List<Thread> threads) {
    threads.removeAt(index);
    Routes().goToHP(context, threads);
  }

  buildTimeLine(
      {required BuildContext context, required List<Thread> threads}) {
    List<Widget> graph = [];

    double suma = 0;
    for (int i = 0; i < threads.length; i++) {
      suma += threads[i].getQuantums();
    }

    double wd = MediaQuery.of(context).size.width;
    wd = wd - 70;
    double size = wd / suma;

    int all = 0;
    for (int i = 0; i < threads.length; i++) {
      for (int s = 0; s < threads[i].getQuantums(); s++) {
        all++;
      }
    }

    int position = threads[0].getArrival();

    for (int i = 0; i < threads.length; i++) {
      for (int s = 0; s < threads[i].getQuantums(); s++) {
        graph.add(Container(
          width: size,
          height: 20,
          decoration: BoxDecoration(
              color: threads[i].getColor(),
              borderRadius: BorderRadius.circular(60)),
        ));
      }
    }

    return graph;
  }

  List<Widget> buildTable(BuildContext context,
      {required List<Thread> threads}) {
    List<Widget> table = [];

    table.add(tableRow(context, c: 0, thread: threads[0], threads: threads));
    for (int i = 0; i < threads.length; i++) {
      table.add(tableRow(context, c: 1, thread: threads[i], threads: threads));
    }
    table.add(tableRow(context, c: 2, thread: threads[0], threads: threads));

    return table;
  }

  Widget tableRow(BuildContext context,
      {required int c, required Thread thread, required List<Thread> threads}) {
    double wd = MediaQuery.of(context).size.width;
    wd = wd - 40;

    switch (c) {
      case 0:
        return Container(
          margin: EdgeInsets.symmetric(vertical: 1),
          width: wd,
          height: 25,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(60)),
          child: Row(
            children: <Widget>[
              Container(
                width: wd / 4,
                height: 21,
                padding: EdgeInsets.symmetric(vertical: 3.5),
                child: const Text(
                  'Proceso',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: wd / 4,
                height: 21,
                padding: EdgeInsets.symmetric(vertical: 3.5),
                child: const Text(
                  'TE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: wd / 4,
                height: 21,
                padding: EdgeInsets.symmetric(vertical: 3.5),
                child: const Text(
                  'TR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: wd / 4,
                height: 21,
                padding: EdgeInsets.symmetric(vertical: 3.5),
                child: const Text(
                  'TP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      case 1:
        return Container(
          margin: EdgeInsets.symmetric(vertical: 1),
          width: wd,
          height: 25,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(60)),
          child: Row(
            children: <Widget>[
              Container(
                width: wd / 4,
                height: 21,
                padding: EdgeInsets.symmetric(vertical: 3.5),
                decoration: BoxDecoration(
                    color: thread.getColor(),
                    borderRadius: BorderRadius.circular(60)),
                child: Text(
                  thread.getName(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: wd / 4,
                height: 21,
                padding: EdgeInsets.symmetric(vertical: 3.5),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(60)),
                child: Text(
                  '${thread.getTE()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: wd / 4,
                height: 21,
                padding: EdgeInsets.symmetric(vertical: 3.5),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(60)),
                child: Text(
                  '${thread.getTR()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: wd / 4,
                height: 21,
                padding: EdgeInsets.symmetric(vertical: 3.5),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(60)),
                child: Text(
                  '${thread.getTP()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      case 2:
        return Container(
          margin: EdgeInsets.symmetric(vertical: 1),
          width: wd,
          height: 25,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(60)),
          child: Row(
            children: <Widget>[
              Container(
                width: wd / 4,
                height: 21,
                padding: EdgeInsets.symmetric(vertical: 3.5),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(60)),
                child: const Text(
                  'Promedio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: wd / 4,
                height: 21,
                padding: EdgeInsets.symmetric(vertical: 3.5),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(60)),
                child: Text(
                  '${getAverage(0, threads)} u.t.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: wd / 4,
                height: 21,
                padding: EdgeInsets.symmetric(vertical: 3.5),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(60)),
                child: Text(
                  '${getAverage(1, threads)} u.t.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: wd / 4,
                height: 21,
                padding: EdgeInsets.symmetric(vertical: 3.5),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(60)),
                child: Text(
                  '${getAverage(2, threads)} u.t.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }

  double getAverage(int time, List<Thread> threads) {
    double suma = 0;
    switch (time) {
      case 0:
        for (int i = 0; i < threads.length; i++) {
          suma += threads[i].getTE();
        }

        return suma / threads.length;
        break;

      case 1:
        for (int i = 0; i < threads.length; i++) {
          suma += threads[i].getTR();
        }

        return suma / threads.length;
        break;

      case 2:
        for (int i = 0; i < threads.length; i++) {
          suma += threads[i].getTP();
        }

        return suma / threads.length;
        break;
      default:
        return 0;
    }
  }
}
