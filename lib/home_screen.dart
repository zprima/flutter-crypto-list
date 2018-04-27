import 'dart:async';
import 'dart:convert';
import 'package:crypto_cat/crypto_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Crypto App")
      ),
      body: new FutureBuilder(
          future: _getCurrencies(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState){
              case ConnectionState.none:
                return new Text("Press something to start");
              case ConnectionState.waiting:
                return new Text("waiting");
              default:
                if(snapshot.hasError){
                  return new Text("Error: ${snapshot.error}");
                } else {
                  return new CryptoList(currencies: snapshot.data);
                }

            }
          }
      )
    );
  }


  Future<List> _getCurrencies() async {
    String apiUrl = 'https://api.coinmarketcap.com/v1/ticker/?limit=20';
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }
}
