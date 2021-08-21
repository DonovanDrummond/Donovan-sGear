import 'package:flutter/material.dart';
import 'package:trainwithflutter/BrandMaker.dart';

import 'package:csv/csv.dart';
import 'dart:async';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Games and Gears',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Games and Gears'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//this will make the home page ui
class _MyHomePageState extends State<MyHomePage> {
  @override
  //this will be used to hold all the information of the table
  List<List<dynamic>> table = [];
  void findingBrands() async {
    //will this will make a completer named completer
    Completer<String> completer = Completer();
    //this take gets the data of the Data.cvs
    final productData = await rootBundle.loadString("data/Data.csv");
    //this will do the task until it is complete
    completer.complete(productData);
    //this will get the product data and convert it into a list
    table = CsvToListConverter().convert(productData);
  }

//this is repsonseable for building the main page's ui
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //this is the headset button

            MaterialButton(
              onPressed: () async {
                findingBrands();
                Completer().complete(table);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListType(type: "Headsets", table: table)));
              },
              child: FittedBox(
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .9,
                      height: 100,
                      child: Text(
                        "HeadSets",
                        style: TextStyle(fontSize: 50),
                      ),
                      decoration: BoxDecoration(border: Border.all(), color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(35))))),
            ),
            //this is the console button

            MaterialButton(
              onPressed: () {
                findingBrands();
                Completer().complete(table);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListType(type: "Console", table: table)));
              },
              child: FittedBox(
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .9,
                      height: 100,
                      child: Text(
                        "Gamming Consoles",
                        style: TextStyle(fontSize: 30),
                      ),
                      decoration: BoxDecoration(border: Border.all(), color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(35))))),
            ),
            //this is the controller button

            MaterialButton(
                onPressed: () {
                  findingBrands();
                  Completer().complete(table);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListType(type: "Controller", table: table)));
                },
                child: FittedBox(
                    child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        height: 100,
                        alignment: Alignment.center,
                        child: Text(
                          "Controller",
                          style: TextStyle(fontSize: 50),
                        ),
                        decoration: BoxDecoration(border: Border.all(), color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(35)))))),
          ],
        ),
      ),
    );
  }
}
