import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/servicos/banco_central.dart';
import 'package:flutter_complete_guide/servicos/qr_code.dart';
import 'package:flutter_complete_guide/servicos/truelayer.dart';
import 'package:flutter_complete_guide/widgets/logo.dart';
import 'package:flutter_complete_guide/widgets/servico_novo.dart';
import 'cambio.dart';
import 'next.dart';

class TelaDeServicos extends StatefulWidget {
  @override
  _TelaDeServicosState createState() => _TelaDeServicosState();
}

class _TelaDeServicosState extends State<TelaDeServicos> {
  bool _addServico = false;
  bool _addServico2 = false;
  bool _addServico3 = false;
  bool _addServico4 = false;

  goToCambio() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Cambio()));
    });
  }

  goToNext() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Next()));
    });
  }

  goToBc() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BancoCentral()));
    });
  }

  goToTrueLayer() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TrueLayer()));
    });
  }

  goToQrcode() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => QrCode()));
    });
  }

  void _adicionarServico(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.purple),
              title: Text(
                "Serviços disponíveis",
                style: TextStyle(color: Colors.purple),
              ),
              centerTitle: true,
            ),
            body: Stack(children: <Widget>[
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.withOpacity(0.7),
                        Colors.blue.withOpacity(0.7),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight,
                    ),
                    //width: double.infinity,
                    //child: Image.asset(
                    //  'images/fundo_servicos.jpg',
                    //  fit: BoxFit.fill,
                    //)
                  )),
              ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey.shade700,
                      child: SwitchListTile(
                        title: new Text(
                          "Bradesco Câmbio",
                          style: TextStyle(
                            color: Colors.red,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          "Moedas estrangeiras",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        secondary: Image.asset('images/bradesco_logo.png'),
                        value: _addServico,
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.red,
                        activeTrackColor: Colors.green,
                        onChanged: (val) {
                          setState(() {
                            if (_addServico == false) {
                              _addServico = true;
                            } else
                              _addServico = false;
                          });
                        },
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.green.shade700,
                      child: SwitchListTile(
                        title: new Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          "Banco digital",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        secondary: Image.asset('images/next.png'),
                        value: _addServico2,
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.red,
                        activeTrackColor: Colors.green,
                        onChanged: (val) {
                          setState(() {
                            if (_addServico2 == false) {
                              _addServico2 = true;
                            } else
                              _addServico2 = false;
                          });
                        },
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      child: SwitchListTile(
                        title: new Text(
                          "Banco Central",
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          "Moeda em Circulação",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),
                        secondary: Image.asset(
                          'images/banco_central.png',
                          width: 95,
                        ),
                        value: _addServico3,
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.red,
                        activeTrackColor: Colors.green,
                        onChanged: (val) {
                          setState(() {
                            if (_addServico3 == false) {
                              _addServico3 = true;
                            } else
                              _addServico3 = false;
                          });
                        },
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.black,
                      child: SwitchListTile(
                        title: new Text(
                          "Mock Bank",
                          style: TextStyle(
                            color: Colors.amber,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          "Conta",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        secondary: Image.asset(
                          'images/mb.png',
                          width: 95,
                        ),
                        value: _addServico4,
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.red,
                        activeTrackColor: Colors.green,
                        onChanged: (val) {
                          setState(() {
                            if (_addServico4 == false) {
                              _addServico4 = true;
                            } else
                              _addServico4 = false;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.purple),
          title: Logo(),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
        drawer: new Drawer(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                child: new ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Container(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: new UserAccountsDrawerHeader(
                            decoration: BoxDecoration(
                                color: Colors.pink[500].withOpacity(0.5),
                                borderRadius:
                                    new BorderRadius.all(Radius.circular(6))),
                            accountEmail: new Text(
                              "Email: user@email.com",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            accountName: new Text(
                              "Bem-vindo: User",
                              style: TextStyle(
                                color: Colors.purple.shade800,
                              ),
                            ),
                            currentAccountPicture: new CircleAvatar(
                              backgroundImage: AssetImage("images/avatar.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: new Text(
                          "Menu",
                          style: TextStyle(
                            color: Colors.purple.shade800,
                            fontSize: 17.5,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    new Divider(
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: goToQrcode,
                        child: Container(
                          decoration: new BoxDecoration(
                              color: Colors.blue[400].withOpacity(0.5),
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(6.0))),
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12, left: 10),
                            child: new Text(
                              "Pagamentos/Cobranças",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new Divider(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () => debugPrint("função CALL"),
                        child: Container(
                          decoration: new BoxDecoration(
                              color: Colors.blue[400].withOpacity(0.5),
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(6.0))),
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12, left: 10),
                            child: new Text(
                              "Grupos",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Logo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () => debugPrint("função CALL"),
                        child: Container(
                          decoration: new BoxDecoration(
                              color: Colors.blue[400].withOpacity(0.5),
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(6.0))),
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12, left: 10),
                            child: new Text(
                              "Configurações",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new Divider(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () => debugPrint("função CALL"),
                        child: Container(
                          decoration: new BoxDecoration(
                              color: Colors.blue[400].withOpacity(0.5),
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(6.0))),
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12, left: 10),
                            child: new Text(
                              "Ajuda",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: new Image.asset(
                  "images/fundo_drawer.png",
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
          backgroundColor: Colors.pink,
          elevation: 20,
          onPressed: () => _adicionarServico(context),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
            Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset('images/fundo_drawer.png')),
            ListView(
              children: <Widget>[
                if (_addServico == false &&
                    _addServico2 == false &&
                    _addServico3 == false &&
                    _addServico4 == false)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Container(
                        child: Text(
                          "Nenhum serviço ativado",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                if (_addServico == true)
                  GestureDetector(
                    child: ServicoNovo(
                        Colors.grey,
                        'images/bradesco_logo.png',
                        'Bradesco Câmbio',
                        Colors.red,
                        'Moedas estrangeiras',
                        Colors.white),
                    onTap: () {
                      setState(() {
                        goToCambio();
                      });
                    },
                  )
                else
                  Container(),
                if (_addServico2 == true)
                  GestureDetector(
                    child: ServicoNovo(Colors.green, 'images/next.png', 'Next',
                        Colors.black, "Banco digital", Colors.black),
                    onTap: () {
                      setState(() {
                        goToNext();
                      });
                    },
                  )
                else
                  Container(),
                if (_addServico3 == true)
                  GestureDetector(
                    child: ServicoNovo(
                        Colors.white,
                        'images/banco_central.png',
                        'Banco Central',
                        Colors.blue.shade900,
                        'Moeda em Circulação',
                        Colors.blueGrey),
                    onTap: () {
                      setState(() {
                        goToBc();
                      });
                    },
                  )
                else
                  Container(),
                if (_addServico4 == true)
                  GestureDetector(
                    child: ServicoNovo(Colors.black, 'images/mb.png',
                        'MockBank', Colors.amber, 'Conta', Colors.white),
                    onTap: () {
                      setState(() {
                        goToTrueLayer();
                      });
                    },
                  )
                else
                  Container(),
              ],
            ),
          ],
        ));
  }
}
