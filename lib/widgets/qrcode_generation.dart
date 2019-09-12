import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class GeradorQRCode extends StatefulWidget {
  String nomeFavorecido;
  String valor;
  String nomeDepositante;

  GeradorQRCode(this.nomeFavorecido, this.valor, this.nomeDepositante);

  @override
  _GeradorQRCodeState createState() => _GeradorQRCodeState();
}

class _GeradorQRCodeState extends State<GeradorQRCode> {

  GlobalKey globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Transferência para ${widget.nomeFavorecido}',style: TextStyle(color: Colors.pink),),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 1,
            iconTheme: IconThemeData(color: Colors.purple),
          ),
          floatingActionButton: FloatingActionButton(
            //onPressed: _captureAndSharePng,
            child: Icon(Icons.send),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            child: RepaintBoundary(
              key: globalKey,
                          child: QrImage(
                data:"id: 21348956-3324"+
                "\nDepositador: ${widget.nomeDepositante}" +
                    "\nValor: ${widget.valor}" +
                    "\nFavorecido: ${widget.nomeFavorecido}",
                version: QrVersions.auto,
                size: 250,
              ),
            ),
          ),
        ),
      ),
    );
  }
   Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);

      final channel = const MethodChannel('channel:me.alfian.share/share');
      channel.invokeMethod('shareFile', 'image.png');

    } catch(e) {
      print(e.toString());
    }
  }
}
