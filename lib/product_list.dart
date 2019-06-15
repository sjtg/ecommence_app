import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ProductList extends StatefulWidget {
  @override
  ProductListState createState(){
    return new ProductListState();
  }
}




class ProductListState extends State<ProductList> {

  var products;
  Color mainColor = const Color(0xff3C3261);

  void getData()  async{
    var data = await getJson();
    setState((){
      products = data['results'];
    });
  }

  @override
  Widget build(BuildContext context){
    getData();


    // Color mainColor = const Color(0xff3C3261);
    // Widget build(BuildContext context){

      return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          elevation: 0.3,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: new Icon (
            Icons.arrow_back,
            color: mainColor,
          ),
          title: new Text(
            'Products',
            style: new TextStyle(color: mainColor, fontFamily:'Arvo',fontWeight: FontWeight.bold ),

          ),
          actions: <Widget>[
            new Icon(
              Icons.menu,
              color: mainColor,
            )
          ],
        ),
         body: new Padding (
            padding: const EdgeInsets.all(16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new ProductTitle(mainColor),
                new Expanded(
                  child: new ListView.builder(
                  itemCount: products == null ? 0 : products.length,
                  itemBuilder: (context, i) {
                  return  new FlatButton(

                    child: new ProductCell(products,i),
                    padding: const EdgeInsets.all(0.0),
                    color: Colors.white,
                  );

                }),
                )
              ],
            )
          ),
      );
    }
  }
  

Future<Map> getJson() async{
  // var url = 'http://shopamate.shop/api/storepageproduct/?format=json';
  var url = 'http://shopamate.shop/api/storepageproduct/';
  http.Response response = await http.get(url);
  return json.decode(response.body);

}


class ProductTitle extends StatelessWidget{

  final Color mainColor;


  ProductTitle(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: new Text(
        'Products',
        style: new TextStyle(
            fontSize: 40.0,
            color: mainColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arvo'
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

}



class ProductCell extends StatelessWidget{

  final products;
  final i;
  Color mainColor = const Color(0xff3C3261);
//  var image_url = 'http://shopamate.shop/media/Stores/Store/ProductImage/';
  ProductCell(this.products,this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Container(
                margin: const EdgeInsets.all(16.0),
                child: new Container(
                  width: 70.0,
                  height: 70.0,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: new NetworkImage(
                         products[i]['storeProductImage']),
                      fit: BoxFit.cover),
                  boxShadow: [
                    new BoxShadow(
                        color: mainColor,
                        blurRadius: 5.0,
                        offset: new Offset(2.0, 5.0))
                  ],
                ),
              ),
            ),
            new Expanded(

                child: new Container(
                  margin: const      EdgeInsets.fromLTRB(16.0,0.0,16.0,0.0),
                  child: new Column(children: [
                    new Text(
                      products[i]['storeProductDescription'],
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Arvo',
                          fontWeight: FontWeight.bold,
                          color: mainColor),
                    ),
                    new Padding(padding: const EdgeInsets.all(2.0)),
                    new Text(products[i]['storeProductDescription'],
                      maxLines: 3,
                      style: new TextStyle(
                          color: const Color(0xff8785A4),
                          fontFamily: 'Arvo'
                      ),)
                  ],
                    crossAxisAlignment: CrossAxisAlignment.start,),
                )
            ),
          ],
        ),
        new Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );

  }

}

// new Expanded(
//   child : new ListView.builder(
//     itemCount: products == null ? 0: products.length,
//     itemBuilder:  (context, i) {
//       return new FlatButton (
//         child: new ProductCell(products, i),
//         padding: const EdgeInsets.all(0.0),
//         onPressed: (){
//           Navigator.push(context, new MaterialPageRoute(builder: (context){
//             return new ProductDetail(products[i]);
//           }));
//         }, 
//         color: Colors.white,
//         );
//     }),
// )