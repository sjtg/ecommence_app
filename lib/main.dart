import 'package:flutter/material.dart';
import 'product_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Product List',
      home: new ProductList(),
    );
  }
}