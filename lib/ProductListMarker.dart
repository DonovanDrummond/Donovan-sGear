import 'dart:convert';
import 'dart:developer';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:trainwithflutter/Product.dart';

class ListProducts extends StatefulWidget {
  //this holds the brand
  String brands;
  //this will hold the table to be used
  List<List<dynamic>>? table;

  ListProducts({Key? key, this.brands = "", this.table}) : super(key: key);

  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  //this will hold the list of products
  List<dataOrganizer> listOfProducts = [];
  //this will hold the is of picture to the products
  List<Image> listOfImage = [];

  void itemPickerProductsList() {
    //this will be the counter for each item
    int counter = 0;
    //for each item in table  it will do the statment below
    widget.table?.forEach((element) {
      //if the the record has the brand  will  do the statment below
      if (element[2] == widget.brands) {
        //this will add the data into the list
        listOfProducts.add(dataOrganizer(counter, element[3], element[2], element[15], element[7]));
      }
      // this will increase conter

      counter++;
    });
  }

//this will make this makes the product each product
  Widget product(dataOrganizer tempdataOrganizer) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: MaterialButton(
        color: Colors.black,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductItem(
                        productDescription: tempdataOrganizer.description,
                        imagepath: tempdataOrganizer.imagePath,
                        productname: tempdataOrganizer.name,
                        productBrand: widget.brands,
                      )));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                tempdataOrganizer.imagePath,
                height: 90,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                  tempdataOrganizer.name,
                  softWrap: true,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(10), color: Colors.white),
        ),
      ),
    );
  }

//this will build the UI for the product list
  Widget build(BuildContext context) {
    //this will call table maker
    itemPickerProductsList();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Container(
            child: FittedBox(
                child: Container(
                    decoration: BoxDecoration(border: Border.all(), color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(35))),
                    child: Text(
                      widget.brands,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ))),
            alignment: Alignment.centerRight,
          )),
      backgroundColor: Colors.black,
      body: Container(
        child: ListView.builder(
            itemCount: listOfProducts.length,
            itemBuilder: (context, index) {
              return product(listOfProducts[index]);
            }),
        color: Colors.black,
      ),
    );
  }
}

class dataOrganizer {
  int id = 0;
  String name = "";
  String brand = "";
  String imagePath;
  String description;
  dataOrganizer(this.id, this.name, this.brand, this.imagePath, this.description);
}
