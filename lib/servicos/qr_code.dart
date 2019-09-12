import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/qrcode_generation.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class QrCode extends StatefulWidget {
  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  String barcode = "";
  final _formKey = GlobalKey<FormState>();
  final _valor = new TextEditingController();
  final _nomeFavorecido = new TextEditingController();
  final _nomeDeposito = new TextEditingController();

  gerar() {
    setState(() {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return GeradorQRCode(
                _nomeFavorecido.text, _valor.text, _nomeDeposito.text);
          });
    });
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pagamentos/Cobranças"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isNotEmpty) {
                          } else {
                            return ('Erro: Digite o nome do favorecido');
                          }
                        },
                        controller: _nomeFavorecido,
                        decoration:
                            InputDecoration(labelText: 'Nome do favorecido'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isNotEmpty) {
                          } else {
                            return ('Erro: Digite o valor para envio');
                          }
                        },
                        controller: _valor,
                        decoration: InputDecoration(labelText: 'Valor'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isNotEmpty) {
                          } else {
                            return ('Erro: Digite o nome do depositante');
                          }
                        },
                        controller: _nomeDeposito,
                        decoration:
                            InputDecoration(labelText: 'Nome Depositante'),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          barcode,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                height: 60,
                child: RaisedButton.icon(
                  elevation: 0,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  color: Colors.purple,
                  icon: Icon(
                    Icons.monetization_on,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Gerar Cobrança',
                    style: Theme.of(context).appBarTheme.textTheme.title,
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print("validou!");
                      gerar();
                    }
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                      Colors.white,
                      Colors.purple,
                    ])),
                height: 60,
                child: RaisedButton.icon(
                  elevation: 0,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  color: Theme.of(context).accentColor,
                  icon: Icon(
                    Icons.camera,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Pagamento',
                    style: Theme.of(context).appBarTheme.textTheme.title,
                  ),
                  onPressed: () {
                    scan();
                  },
                ),
              ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
