import 'package:flutter/material.dart';
import 'product_list.dart';
import 'splashScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Shopamate',
      routes: <String, WidgetBuilder>{
        // "/HomeScreen": (BuildContext context) => HomeScreen(),
        // "/LoginScreen": (BuildContext context) => LoginScreen(),
      },
      home: SplashScreen(),
      // product_home:  new ProductList(),
    );
  }
}

