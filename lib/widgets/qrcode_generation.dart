import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class GeradorQRCode extends StatelessWidget {
  String nomeFavorecido;
  String valor;
  String nomeDepositante;

  GeradorQRCode(this.nomeFavorecido, this.valor, this.nomeDepositante);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Transferir para $nomeFavorecido'),
            centerTitle: true,
            backgroundColor: Colors.red,
          ),
          body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            child: QrImage(
              data:"id: 21348956-3324"+
              "\nDepositador: $nomeDepositante" +
                  "\nValor: $valor" +
                  "\nFavorecido: $nomeFavorecido",
              version: QrVersions.auto,
              size: 250,
            ),
          ),
        ),
      ),
    );
  }
}
