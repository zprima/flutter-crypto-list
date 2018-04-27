import 'package:crypto_cat/crypto_list_item.dart';
import 'package:flutter/material.dart';

class CryptoList extends StatelessWidget {
  final List currencies;

  CryptoList({this.currencies});

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.blue,
      margin: new EdgeInsets.all(0.0),
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final Map currency = currencies[index];

                return new CryptoListItem(currency: currency);
              },
            ),
          )
        ],
      )
    );
  }
}
