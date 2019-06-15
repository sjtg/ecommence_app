import 'package:shopamate_app/product_details.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class ProductDetail extends StatelessWidget {

  final product;

  var image_url = 'https://image.tmdb.org/t/p/w500/';
  ProductDetail(this.product);
  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: [
          new Image.network(image_url+product['poster_path'], fit: BoxFit.cover),
          new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: new Container(
              color: Colors.black.withOpacity(0.5),
            ),
            ),
            new SingleChildScrollView(
              child: new Container (
                children: <Widget>[
                  alignment: Alignment.center,
                  child: new Container(width: 400.0, height: 400.0,),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    image: new DecorationImage(image : new
                    NetworkImage(image_url + product['poster+path']), fit: BoxFit.cover),
                    boxShadow : [
                      new BoxShadow (
                        color: Colors.black,
                        blurRadius: 20.0,
                        offset: new Offset(0.0, 10.0)
                      )
                    ]
                  ),

                ]
              ),
            ),
        ]
      )
    );
  }
}