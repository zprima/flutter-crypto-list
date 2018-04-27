import 'package:flutter/material.dart';

class CryptoListItem extends StatelessWidget {
  final Map currency;

  CryptoListItem({
    this.currency
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(5.0),
      child: new Card(
        child: new ListTile(
          leading: new CircleAvatar(
            backgroundColor: _getPercentageColor(currency["percent_change_1h"]),
            child: new Text(currency["name"][0],
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              )
            )
          ),
          title: new Text(currency["name"],
            style: new TextStyle(fontWeight: FontWeight.bold)
          ),
          subtitle: _getSubtitleText(currency),
          isThreeLine: true,
        )
      )
    );
  }

  Color _getPercentageColor(percentChange1H){
    if (double.parse(percentChange1H) > 0.0){
      return Colors.green;
    }
    return Colors.red;
  }

  RichText _getSubtitleText(currency){
    String priceUsd = currency["price_usd"];
    String percentChange1H = currency["percent_change_1h"];

    TextSpan textPrice = new TextSpan(
      text: "\$$priceUsd\n",
      style: new TextStyle(
        color: Colors.black
      )
    );

    TextSpan textPriceChange = new TextSpan(
      text: "$percentChange1H% in 1 hour",
      style: new TextStyle(
        color: _getPercentageColor(percentChange1H)
      )
    );

    return new RichText(text: new TextSpan(
      children: [
        textPrice,
        textPriceChange
      ]
    ));
  }
}
