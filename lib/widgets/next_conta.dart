import 'package:flutter/material.dart';

class NextConta extends StatefulWidget {
  @override
  _NextContaState createState() => _NextContaState();
}

class _NextContaState extends State<NextConta> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/next.png'),
                Text(
                  'Flow disponível',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  'R\$ 2.895,33',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            )
      );
  }
}