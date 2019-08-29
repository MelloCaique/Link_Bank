import 'dart:convert';
import 'package:flutter/material.dart' as prefix0;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class BancoCentral extends StatefulWidget {
  @override
  _BancoCentralState createState() => _BancoCentralState();
}

class _BancoCentralState extends State<BancoCentral> {
  Map data;

  void showStuff() async {
    data = await getExchange();
    print(data["value"].length);
    print(data['value'][3]['Valor']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Colors.cyan.shade900,
                ),
                onPressed: showStuff),
          ],
          iconTheme: IconThemeData(
            color: Colors.cyan.shade900,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            'images/bc_bar.png',
            height: 50,
          ),
        ),
        body: Center(
          child: updateLista(),
        ));
  }

  Future<Map> getExchange() async {
    String apiUrl =
        "https://olinda.bcb.gov.br/olinda/servico/mecir_dinheiro_em_circulacao" +
            "/versao/v1/odata/informacoes_diarias?\$top=10000&\$skip=77299&\$format=" +
            "json&\$select=Data,Valor,Denominacao,Especie";

    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }

  Widget updateLista() {
    return new prefix0.FutureBuilder(
        future: getExchange(),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            var _values = content['value'];

            return ListView.builder(
                itemCount: _values.length,
                itemBuilder: (BuildContext context, int position) {
                  if (position.isOdd) return new Divider();
                  final index = position ~/ 2;

                  return prefix0.Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: new ListTile(
                        title: prefix0.Row(
                          mainAxisAlignment:
                              prefix0.MainAxisAlignment.spaceBetween,
                          children: <prefix0.Widget>[
                            new Text(
                              "R\$: ${_values[index]['Valor'].toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: Colors.cyan.shade900,
                                  fontWeight: prefix0.FontWeight.bold,
                                  fontSize: 18),
                            ),
                            prefix0.Text("${_values[index]['Especie']}"),
                          ],
                        ),
                        subtitle: prefix0.Row(
                          mainAxisAlignment:
                              prefix0.MainAxisAlignment.spaceBetween,
                          children: <prefix0.Widget>[
                            new prefix0.Text("Valor em Circulação"),
                            new Text(
                              "${_values[index]['Data']}",
                              style: prefix0.TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.blue.shade800,
                          radius: 30,
                          child: new Text(
                            "${_values[index]['Denominacao']}",
                            style: prefix0.TextStyle(
                              fontWeight: prefix0.FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return new prefix0.CircularProgressIndicator(
              backgroundColor: Colors.purple,
              
            );
          }
        });
  }
}
