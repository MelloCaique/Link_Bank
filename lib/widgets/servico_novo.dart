import 'package:flutter/material.dart';

class ServicoNovo extends StatelessWidget {
  String image;
  Color colorCard;
  String titulo;
  Color colorTitulo;
  String subtittle;
  Color colorSubtittle;

  ServicoNovo(this.colorCard, this.image, this.titulo, this.colorTitulo,
      this.subtittle, this.colorSubtittle);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: colorCard,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
        elevation: 10,
        child: ListTile(
          leading: Image.asset('$image'),
          title: new Text(
            "$titulo",
            style: TextStyle(
              color: colorTitulo,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            "$subtittle",
            style: TextStyle(color: colorSubtittle, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
