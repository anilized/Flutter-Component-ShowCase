import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = "/products";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: Container(
        child: Center(
          child: Text("Products"),
        ),
      ),
    );
  }
  
}