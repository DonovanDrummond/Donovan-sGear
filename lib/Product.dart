import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  String imagepath;
  String productname;
  String productBrand;
  String productDescription;
  ProductItem({Key? key, this.productname = "", this.productDescription = "", this.imagepath = "", this.productBrand = ""}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

//this will build the UI for the product
class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey,
            title: Container(
              child: FittedBox(
                  child: Container(
                      decoration: BoxDecoration(border: Border.all(), color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(35))),
                      child: Text(
                        widget.productBrand,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ))),
              alignment: Alignment.centerRight,
            )),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              Container(
                child: Image.network(widget.imagepath),
                width: 300,
                height: 300,
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height * .03,
                  child: Text(widget.productname),
                ),
                margin: EdgeInsets.all(10),
              ),
              Card(
                color: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  child: Text(widget.productDescription),
                ),
                margin: EdgeInsets.all(10),
              )
            ],
          ),
        ));
  }
}
