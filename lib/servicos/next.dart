import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/next_conta.dart';
import 'package:flutter_complete_guide/widgets/next_invest.dart';
import 'package:flutter_complete_guide/widgets/next_perfil.dart';

class Next extends StatefulWidget {
  @override
  _NextState createState() => _NextState();
}

class _NextState extends State<Next> {


  int _currentIndex = 0;
  final List<Widget> _children = [
    NextConta(),
    NextInvest(),
    NextPerfil()
  ];


   void onTabTapped(int index){
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "next",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.green,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Icon(
            Icons.refresh,
            color: Colors.green,
          )
        ],
      ),
      bottomNavigationBar:
          BottomNavigationBar(backgroundColor: Colors.black, 
          currentIndex: 0,
          onTap: onTabTapped,
          items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.credit_card,
              color: Colors.grey,
            ),
            title: Text(
              "Crédito",
              style: TextStyle(
                color: Colors.grey,
              ),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.monetization_on,
              color: Colors.grey,
            ),
            title: Text(
              "Investimentos",
              style: TextStyle(
                color: Colors.grey,
              ),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.money_off,
              color: Colors.grey,
            ),
            title: Text(
              "Gastos",
              style: TextStyle(
                color: Colors.grey,
              ),
            )),
      ]),
      body: _children[_currentIndex],
    );
  }
}
