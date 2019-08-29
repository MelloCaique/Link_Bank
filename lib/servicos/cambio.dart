import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/data/user_data.dart';
import 'package:http/http.dart' as http;

class Cambio extends StatefulWidget {
  @override
  _CambioState createState() => _CambioState();
}

class _CambioState extends State<Cambio> {
  double saldo =
      double.parse('${contaCorrente['user'][userAtual]['cc'][0]['saldo']}');
  double descontar = 0;
  double soma = 0;
  String moedaRequerida;

  final compra = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  alterar() {
    setState(() {
      saldo = saldo - (descontar * valorAtual);
      soma = soma + descontar;
    });
  }

  void showStuff() async {
    Map data = await getExchange(realDefault);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: showStuff),
          ],
          title: new Text(
            "Bradesco Câmbio",
            style: TextStyle(
              color: Colors.red,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade400),
      body: Material(
        child: Form(
          key: _formKey,
          child: Container(
            color: Colors.grey.shade300,
            child: ListView(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Card(
                                color: Colors.white,
                                margin: EdgeInsets.all(8),
                                elevation: 10,
                                child: ListTile(
                                  leading: Image.asset('images/brasil.png'),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Text(
                                        "Real",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      new Text(
                                        "BRL\$: 1.00",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text("Data hoje"),
                                ),
                              ),
                              Divider(),
                              updateMoedas(realDefault),
                              Divider(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Card(
                                  elevation: 4,
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        new Text(
                                          "Saldo em conta corrente",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Divider(),
                                        new Text(
                                          'R\$: ${saldo.toStringAsFixed(2)}',
                                          style: TextStyle(fontSize: 26),
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              'Comprar',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              'Dólar',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: TextFormField(
                                            controller: compra,
                                            validator: (value) {
                                              if ((value.isNotEmpty &&
                                                  ((double.parse(value) *
                                                          valorAtual)) <=
                                                      saldo)) {
                                                descontar = double.parse(value);
                                              } else {
                                                return 'Saldo insuficiente';
                                              }
                                            },
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: ('Valor para compra'),
                                              hintText:
                                                  ('Quantia em dólares - U\$'),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 90),
                                          child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              color: Colors.red,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    "Comprar",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Icon(
                                                    Icons.attach_money,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  if (_formKey.currentState
                                                      .validate()) {
                                                    print("validou");
                                                    alterar();
                                                  } else {
                                                    print("Não validou");
                                                  }
                                                });
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                          Divider(
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Card(
                              elevation: 4,
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Saldo Carteira",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Divider(),
                                    Text('${contaCorrente['user'][userAtual]['cartao'][0]['bandeira']} ' +
                                        ' ${contaCorrente['user'][userAtual]['cartao'][2]['numero']}'),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              "Dólar",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Divider(),
                                            Text(
                                              "USD: ${soma.toStringAsFixed(2)}",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              "Euro",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Divider(),
                                            Text(
                                              "EUR: 0.00",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Map> getExchange(String moeda) async {
    String apiUrl = urlDefault + moeda;

    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }

  Widget updateMoedas(String moeda) {
    return new FutureBuilder(
        future: getExchange(moeda == null ? realDefault : moeda),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            double usd = (1 / content['rates']['USD']);
            double eur = (1 / content['rates']['EUR']);
            valorAtual = usd;
            String hoje = ("${content['rates']['date'].toString()}");
            print("aqui");

            return Form(
              child: Container(
                child: new Column(
                  children: <Widget>[
                    Card(
                      color: Colors.white,
                      margin: EdgeInsets.all(8),
                      elevation: 10,
                      child: ListTile(
                        leading: Image.asset('images/euro.png'),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(
                              "Euro",
                              style: TextStyle(
                                color: Colors.red,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            new Text(
                              "BRL\$: ${eur.toStringAsFixed(2)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text("Valor moeda"),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      margin: EdgeInsets.all(8),
                      elevation: 10,
                      child: ListTile(
                        leading: Image.asset('images/usa.png'),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(
                              "Dollar",
                              style: TextStyle(
                                color: Colors.red,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            new Text(
                              "BRL\$: ${usd.toStringAsFixed(2)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text("Valor da moeda"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
