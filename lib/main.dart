import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'NewArrival.dart';

Future<List<Products>> fetchProduct(http.Client client) async {
  try{
    final response =
    await client.get('http://meenaclick.com/api/new-arrivals/2');
    if(response.statusCode ==200){
     // var parse =  parseProducts(response.body.replaceAll("ï»¿", ""));
        var data = json.decode(response.body.replaceAll("ï»¿", ""));
        var list = data["products"] as List;

      return list.map<Products>((json) => Products.fromJson(json)).toList();
    }
    else{
      throw Exception("error in parsing");
    }
  }catch (e) {
    throw Exception(e.toString());
  }

  // Use the compute function to run parsePhotos in a separate isolate.

}

// A function that converts a response body into a List<Photo>.
List<Products> parseProducts(String responseBody) {

  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Products>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}







void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'MeenaClick Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Products>>(
        future: fetchProduct(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ProductList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Products> photos;

  ProductList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height/1.7)
      ),
      itemCount: photos.length,

      itemBuilder: (context, index) {
        return Card(

            shape: RoundedRectangleBorder(

              side: BorderSide(color: Colors.white70, width: 1),

              borderRadius: BorderRadius.circular(10),
            ),

            margin: EdgeInsets.only(left: 10,top: 10,right: 10),

            elevation: 10,

            child: Container(

                child: Column(

                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child:Image.network("http://www.meenaclick.com/back_end/assets/product_images/"+photos[index].images[0],fit: BoxFit.fill)
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                      child: Text(photos[index].productName,maxLines: 1)
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                      child: Row(
                        children: <Widget>[
                          Text("Add to cart",style: TextStyle(
                          color: Color.fromRGBO(22, 214, 170, 50),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),

                          Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: new Image.asset('images/plus.png')
                          )
                        ],
                      )
                      
                    )



                  ],
                )
            )



        );
      },
    );
  }
}
