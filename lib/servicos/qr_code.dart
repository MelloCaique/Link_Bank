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
          backgroundColor: Colors.redAccent,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 10,
          child: Icon(
            Icons.camera,
            color: Colors.red,
          ),
          onPressed: scan,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
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
                    decoration: InputDecoration(labelText: 'Nome Depositante'),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 105, right: 105, top: 20),
                  child: new RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Gerar QrCode",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(width: 2,),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print("validou!");
                        gerar();
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    barcode,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
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
