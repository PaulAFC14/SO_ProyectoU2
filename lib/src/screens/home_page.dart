import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:proyecto/src/reusable/graphics.dart';

import '../reusable/routes.dart';
import '../reusable/thread.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  late List<Thread> threads;

  // ignore: non_constant_identifier_names
  HomePage({Key? key, required List<Thread> init_threads}) : super(key: key) {
    threads = init_threads;
  }

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() => _HomePageState(threads: threads);

  void setState(Null Function() param0) {}
}

class _HomePageState extends State<HomePage> {
  late List<Thread> threads;

  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
    });
  }

  Color pickerColor = Color.fromARGB(255, 233, 233, 233);

  String stName = '';
  String stArrival = '';
  String stQuantums = '';
  String stPri = '';

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final arrivalController = TextEditingController();
  final quantumController = TextEditingController();
  final priController = TextEditingController();

  _HomePageState({required this.threads});

  @override
  Widget build(BuildContext context) {
    double wd = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  threads.clear();
                });
              },
              icon: Icon(
                Icons.delete_outline_rounded,
                color: Theme.of(context).primaryColor,
              )),
        ],
        centerTitle: true,
        title: Text(
          'Planificación de procesos',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SizedBox(
            width: double.infinity,
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Ingresa los datos'),
                    SizedBox(
                      height: 10,
                    ),

                    //INICIO COLOR PICKER<<
                    Container(
                      decoration: BoxDecoration(
                          //color: Color.fromARGB(255, 191, 225, 241)
                          ),
                      width: 428,
                      height: 150,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                    content: SingleChildScrollView(
                                      child: ColorPicker(
                                        onColorChanged: changeColor,
                                        pickerColor: pickerColor,
                                      ),
                                    ),
                                    actions: [
                                      IconButton(
                                          onPressed: () {
                                            changeColor(pickerColor);
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.done,
                                            size: 20,
                                          ))
                                    ],
                                  )));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 65),
                            decoration: BoxDecoration(
                                color: pickerColor, shape: BoxShape.circle),
                            child: Icon(
                              Icons.palette_outlined,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    //FINAL COLORPICKER>>

                    //INICIO FORMULARIO<<
                    Container(
                      width: 428,
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 1, vertical: 20),
                                child: Container(
                                  height: 50,
                                  padding: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.circular(60)),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.send,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(color: Colors.black),
                                    cursorColor:
                                        Color.fromARGB(255, 12, 76, 128),
                                    //cursorRadius: const Radius.circular(2),
                                    cursorWidth: 1,
                                    onSaved: (newValue) {
                                      stName = newValue!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Introduzca el nombre';
                                      }
                                    },
                                    controller: nameController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Nombre',
                                        labelStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 12, 76, 128)),
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 12, 76, 128)),
                                        contentPadding:
                                            EdgeInsets.only(left: 20, top: 0),
                                        /*enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              borderSide: BorderSide(color: Colors.orange.shade900)),*/
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 12, 76, 128),
                                              width: 2.2),
                                        )),
                                  ),
                                )),
                            Row(
                              children: [
                                Flexible(
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 0),
                                      child: Container(
                                        height: 50,
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .backgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(60)),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.send,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          cursorColor:
                                              Color.fromARGB(255, 12, 76, 128),
                                          //cursorRadius: const Radius.circular(2),
                                          cursorWidth: 1,
                                          onSaved: (newValue) {
                                            stArrival = newValue!;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Introduzca la llegada';
                                            }
                                          },
                                          controller: arrivalController,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Llegada',
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 12, 76, 128)),
                                              hintStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 12, 76, 128)),
                                              contentPadding: EdgeInsets.only(
                                                  left: 20, top: 0),
                                              /*enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              borderSide: BorderSide(color: Colors.orange.shade900)),*/
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 12, 76, 128),
                                                    width: 2.2),
                                              )),
                                        ),
                                      )),
                                ),
                                Flexible(
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 0),
                                      child: Container(
                                        height: 50,
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .backgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(60)),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.send,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          cursorColor:
                                              Color.fromARGB(255, 12, 76, 128),
                                          //cursorRadius: const Radius.circular(2),
                                          cursorWidth: 1,
                                          onSaved: (newValue) {
                                            stQuantums = newValue!;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Introduzca los quantums';
                                            }
                                          },
                                          controller: quantumController,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Quantums',
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 12, 76, 128)),
                                              hintStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 12, 76, 128)),
                                              contentPadding: EdgeInsets.only(
                                                  left: 20, top: 0),
                                              /*enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              borderSide: BorderSide(color: Colors.orange.shade900)),*/
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 12, 76, 128),
                                                    width: 2.2),
                                              )),
                                        ),
                                      )),
                                ),
                                Flexible(
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 0),
                                      child: Container(
                                        height: 50,
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .backgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(60)),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.send,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          cursorColor:
                                              Color.fromARGB(255, 12, 76, 128),
                                          //cursorRadius: const Radius.circular(2),
                                          cursorWidth: 1,
                                          onSaved: (newValue) {
                                            stPri = newValue!;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Introduzca la Prioridad';
                                            }
                                          },
                                          controller: priController,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Prioridad',
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 12, 76, 128)),
                                              hintStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 12, 76, 128)),
                                              contentPadding: EdgeInsets.only(
                                                  left: 20, top: 0),
                                              /*enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              borderSide: BorderSide(color: Colors.orange.shade900)),*/
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 12, 76, 128),
                                                    width: 2.2),
                                              )),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(vertical: 20),
                              padding: EdgeInsets.symmetric(horizontal: 110),
                              child: ElevatedButton(
                                onPressed: () => addProcess(),
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    primary: Theme.of(context).primaryColor,
                                    onPrimary: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(60))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Icon(Icons.add_circle_outline),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Agregar',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ), //FINAL FORMULARIO>>
                  ],
                ),
                Center(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 25, top: 10),
                      child: Text('Conjunto de procesos')),
                ),
                Graphics().BuildThreadsGrid(
                    context: context, threads: threads, wd: wd)
              ],
            )),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.5)),
                onPressed: () => threads.length > 0
                    ? Routes().goToM1(context, threads)
                    : print('Null'),
                child: Container(
                  width: 50,
                  height: 40,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'FCFS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.5)),
                onPressed: () => threads.length > 0
                    ? Routes().goToM2(context, threads)
                    : print('Null'),
                child: Container(
                  width: 50,
                  height: 40,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'SJF',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.5)),
                onPressed: () => threads.length > 0
                    ? Routes().goToM3(context, threads)
                    : print('Null'),
                child: Container(
                  width: 50,
                  height: 40,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'PRI',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.5)),
                onPressed: () {},
                child: Container(
                  width: 50,
                  height: 40,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'RR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  //Añadir procesos al arreglo
  addProcess() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        threads.add(Thread(
            name: stName,
            arrival: int.parse(stArrival),
            quantums: int.parse(stQuantums),
            color: pickerColor,
            pri: int.parse(stPri)));

        nameController.clear();
        arrivalController.clear();
        quantumController.clear();
        priController.clear();

        pickerColor = Theme.of(context).backgroundColor;
      });
    }
  }
}
