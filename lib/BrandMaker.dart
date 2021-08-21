import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';

import 'package:trainwithflutter/ProductListMarker.dart';

class ListType extends StatefulWidget {
  //this will hold the type of products
  String type;
  //this will hold the table
  List<List<dynamic>>? table;

  ListType({Key? key, this.type = "", this.table}) : super(key: key);

  @override
  _ListTypeState createState() => _ListTypeState();
}

class _ListTypeState extends State<ListType> {
  //this will hold the list of brands
  List<DataOrganizer> listOfBrands = [];

  void itemPickerBrands() {
    //this will be the counter for each item

    int counter = 0;
    //this will hold the type of product
    List<String> doneBrands = [];
    //for each item in table it will do the statment below

    widget.table?.forEach((t) {
      // this will be the bool for if a item has been stored
      bool beenDone = false;
      //for each item in doneBrands it will do the statment below

      doneBrands.forEach((element) {
        //if this element has the brand will will do this statment below
        if (element == t[2]) {
          //this will set beenDone to true
          beenDone = true;
        }
      });

// if beenDone is false then it will do the statment below
      if (beenDone == false) {
        //if the type is the product type then it will do the statment below
        if (t[1] == widget.type) {
          // this will add the brand to the list of the of brands
          listOfBrands.add(DataOrganizer(counter, t[2]));
          //this will add to the list of brands that have been done
          doneBrands.add(t[2]);
        }
      }
      // this will increase conter
      counter++;
    });
  }

  Widget brand(DataOrganizer tempOrganizer) {
    return Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListProducts(brands: tempOrganizer.brand, table: widget.table)));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .15,
              decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    child: Image.asset("images/" + tempOrganizer.brand + ".png"),
                    width: 110,
                    margin: EdgeInsets.only(right: 10),
                  ),
                  Container(padding: EdgeInsets.only(left: 10), alignment: Alignment.centerLeft, child: Text(tempOrganizer.brand)),
                ],
              ),
            )));
  }

//this will make the ui for brands
  Widget build(BuildContext context) {
    //this will call itemPickerBrands
    itemPickerBrands();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: listOfBrands.length,
        itemBuilder: (context, index) {
          return brand(listOfBrands[index]);
        },
      ),
    );
  }
}

class DataOrganizer {
  int id = 0;
  String brand = "";
  DataOrganizer(
    this.id,
    this.brand,
  );
}
