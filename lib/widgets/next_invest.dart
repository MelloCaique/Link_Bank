import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NextInvest extends StatefulWidget {
  @override
  _NextInvestState createState() => _NextInvestState();
}

class _NextInvestState extends State<NextInvest> {
  Map data;

  void showStuff() async {
    data = await getExchange();
    print(data['results']);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: Center(
          child: updateList(),
        ));
  }

  Future<Map> getExchange() async {
    String apiUrl = "https://api.hgbrasil.com/finance?key=58002e71";

    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }

  Widget updateList() {
    return new FutureBuilder(
        future: getExchange(),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            var _values = content["results"]["stocks"];
            print(_values);
            return ListView(
              children: <Widget>[
                Card(
                  color: Colors.black,
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 30,
                      child: Text(
                        '${content["results"]["stocks"]['IBOVESPA']['variation']}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('IBOVESPA', style: TextStyle(color: Colors.white)),
                        Text('Pontuação',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            '${content["results"]["stocks"]['IBOVESPA']['location']}',
                            style: TextStyle(color: Colors.white)),
                        Text(
                            '${content["results"]["stocks"]['IBOVESPA']['points']}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Card(
                  color: Colors.black,
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 30,
                      child: Text(
                        '${content["results"]["stocks"]['NASDAQ']['variation']}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('NASDAQ', style: TextStyle(color: Colors.white)),
                        Text('Pontuação',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            '${content["results"]["stocks"]['NASDAQ']['location']}',
                            style: TextStyle(color: Colors.white)),
                        Text(
                            '${content["results"]["stocks"]['NASDAQ']['points']}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Card(
                  color: Colors.black,
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 30,
                      child: Text(
                        '${content["results"]["stocks"]['CAC']['variation']}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('CAC', style: TextStyle(color: Colors.white)),
                        Text('Pontuação',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            '${content["results"]["stocks"]['CAC']['location']}',
                            style: TextStyle(color: Colors.white)),
                        Text(
                            '${content["results"]["stocks"]['CAC']['points']}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Card(
                  color: Colors.black,
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 30,
                      child: Text(
                        '${content["results"]["stocks"]['NIKKEI']['variation']}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('NIKKEI', style: TextStyle(color: Colors.white)),
                        Text('Pontuação',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            '${content["results"]["stocks"]['NIKKEI']['location']}',
                            style: TextStyle(color: Colors.white)),
                        Text(
                            '${content["results"]["stocks"]['NIKKEI']['points']}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            );
          } else
            return CircularProgressIndicator(
              backgroundColor: Colors.purple,
            );
        });
  }
}
