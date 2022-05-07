import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //final pref = await SharedPreferences.getInstance();

  // Future<void> _incrementCounter() async {
  //   final SharedPreferences prefs = await _prefs;
  //   final int counter = (prefs.getInt('counter') ?? 0) + 1;

  //   setState(() {
  //     _counter = prefs.setInt('counter', counter).then((bool success) {
  //       return counter;
  //     });
  //   });
  // }

  int team1 = 0;
  int team2 = 0;

  // Future<void> showCounter2() async {
  //   final SharedPreferences prefs = await _prefs;
  //   return int counter = (prefs.getInt('counter2') ?? 0) + 1;

  // setState(() {
  //   _counter = prefs.setInt('counter', counter).then((bool success) {
  //     return counter;
  //   });
  // });
  // @override
  // void initState() {
  //   super.initState();
  //   _counter = _prefs.then((SharedPreferences prefs) {
  //     return prefs.getInt('counter') ?? 0;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;
  bool active = true;

  Future<void> _incrementCounter1() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter1') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter1', counter).then((bool success) {
        return counter;
      });
    });
  }

  Future<void> _incrementCounter2() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter2') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter2', counter).then((bool success) {
        return counter;
      });
    });
  }

  Future<int> show1() async {
    final SharedPreferences prefs = await _prefs;
    return (prefs.getInt('counter1') ?? 0);
  }

  Future<void> reset() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('counter1');
    prefs.remove('counter2');
  }

  Future<int> show2() async {
    final SharedPreferences prefs = await _prefs;
    return (prefs.getInt('counter2') ?? 0);
  }

  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Results",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black),
                            ),
                          ),
                          Text("Passcode"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _textEditingController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  filled: true, fillColor: Colors.grey),
                            ),
                          ),
                          GestureDetector(
                              onTap: () async {
                                int t1 = await show1();
                                int t2 = await show2();

                                _textEditingController.text == 4321.toString()
                                    ? showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 100,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Atoms  -> " + t1.toString(),
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text(
                                                  "Unicorn Devs  -> " +
                                                      t2.toString(),
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    reset();
                                                  },
                                                  child: Container(
                                                    child: Text("RESET"),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        })
                                    : Text(
                                        "Wrong Passcode!",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 20),
                                      );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  color: Colors.green,
                                  child: Center(
                                    child: Text(
                                      "SUBMIT",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    );
                  });
            },
            icon: Icon(Icons.poll),
            color: Colors.black,
          )
        ],
        title: Text(
          "The Belfort of Wallstreet",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: active
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     // Text(
                  //     //   "Team 1",
                  //     //   style: TextStyle(
                  //     //       color: Colors.amber,
                  //     //       fontWeight: FontWeight.bold,
                  //     //       fontSize: 20),
                  //     // ),
                  //     // Text(
                  //     //   "Team 2",
                  //     //   style: TextStyle(
                  //     //       color: Colors.red,
                  //     //       fontWeight: FontWeight.bold,
                  //     //       fontSize: 20),
                  //     // ),
                  //   ],
                  // ),
                  // Divider(
                  //   color: Colors.blue,
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      "VOTE FOR",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          _incrementCounter1();
                          int s = await show1();
                          print("Atoms = " + s.toString());
                          setState(() {
                            active = false;
                          });
                          Timer(Duration(seconds: 5), () {
                            setState(() {
                              active = true;
                            });
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            child: Center(
                                child: Text("Atoms",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))),
                            height: 150,
                            width: 150,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () async {
                          _incrementCounter2();
                          int t = await show2();
                          print("Unicorn Dev = " + t.toString());
                          setState(() {
                            active = false;
                          });
                          Timer(Duration(seconds: 5), () {
                            setState(() {
                              active = true;
                            });
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            child: Center(
                                child: Text("Unicorn Dev",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))),
                            height: 150,
                            width: 150,
                            color: active ? Colors.red : Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Text(
                          "Made with 💚 IEDC, CCE",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Vote Registered ✅",
                    style: TextStyle(fontSize: 30, color: Colors.green),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  CircularProgressIndicator(
                    strokeWidth: 100,
                    color: Colors.green,
                    semanticsLabel: "Wait for 5 Seconds",
                  ),
                ],
              ),
      ),
    );
  }
}
