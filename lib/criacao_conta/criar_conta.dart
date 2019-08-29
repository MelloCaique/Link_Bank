import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/data/user_data.dart';
import 'package:flutter_complete_guide/login/login_screen.dart';
import 'package:flutter_complete_guide/servicos/tela_sevicos.dart';
import 'package:flutter_complete_guide/widgets/logo.dart';

class CriarConta extends StatefulWidget {
  @override
  _CriarContaState createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  final _formKey = GlobalKey<FormState>();

  final novoUsuarioController = TextEditingController();
  final novoSenhaController = TextEditingController();


    alertaContaCriada() {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).primaryColorLight,
            title: new Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Logo(),
                    Icon(Icons.lock),
                  ],
                ),
                Text("Conta Criada com Sucesso!")
              ],
            ),
            actions: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text("Ok", style: TextStyle(color: Theme.of(context).primaryColorDark,)),
                    onPressed: () {
                      Navigator.push(
                              context, MaterialPageRoute(builder: (context) => TelaDeServicos()));
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Logo(),
        centerTitle: true,
      ),
      body: Material(
        child: Form(
          key: _formKey,
          child: Stack(children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'images/fundo_login.jpg',
                fit: BoxFit.fill,
              ),
            ),
            ListView(
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Bem-vindo ao Link_Bank",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text("Faça seu cadastro com as informações abaixo",
                                style: TextStyle(fontSize: 15))
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context)
                              .primaryColorLight
                              .withOpacity(0.65),
                        ),
                        height: 260,
                        width: 360,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: novoUsuarioController,
                                decoration: InputDecoration(
                                    labelText: "Digite seu usuário",
                                    hintText:
                                        "Apenas letras sem espaços e símbolos"),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Digite seu usuário";
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: novoSenhaController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    labelText: "Digite sua senha",
                                    hintText: "5 números"),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Digite sua senha";
                                  }
                                },
                                maxLength: 5,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 100, right: 100),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Theme.of(context).primaryColor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      "Criar conta",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.account_circle,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_formKey.currentState.validate()) {
                                      cadastroUsuario.addAll(
                                        {
                                          "${novoUsuarioController.text}":"${novoSenhaController.text}"
                                        }
                                      );
                                      alertaContaCriada();
                                 
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
