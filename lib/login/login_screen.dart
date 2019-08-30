import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/criacao_conta/criar_conta.dart';
import 'package:flutter_complete_guide/data/user_data.dart';
import 'package:flutter_complete_guide/servicos/tela_sevicos.dart';
import 'package:flutter_complete_guide/widgets/logo.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final usuarioController = new TextEditingController();
  final senhaController = new TextEditingController();



  alerta() {
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
                Text("Usuário/Senha Incorretos!")
              ],
            ),
            actions: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text("Tentar novamente", style: TextStyle(color: Theme.of(context).primaryColorDark,)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("Criar conta", style: TextStyle(color: Theme.of(context).primaryColorDark,)),
                    onPressed: () {
                      print("abrir pagina de criar conta");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CriarConta()));
                    },
                  )
                ],
              ),
            ],
          );
        });
  }

  acesso() {
    print("outra tela");
    print(cadastroUsuario);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TelaDeServicos()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'images/fundo_login.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Logo(),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        Theme.of(context).primaryColorLight.withOpacity(0.65),
                  ),
                  height: 250,
                  width: 300,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 6, right: 6),
                        child: TextFormField(
                          controller: usuarioController,
                          validator: (value) {
                            if (value.isNotEmpty &&
                                cadastroUsuario
                                    .containsKey(usuarioController.text) &&
                                cadastroUsuario
                                    .containsValue(senhaController.text)) {
                            } else
                              return "Digite seu usuário";
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: ('Usuário'),
                            hintText: ('Digite seu usuário'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6, right: 6),
                        child: TextFormField(
                          controller: senhaController,
                          validator: (value) {
                            if (value.isNotEmpty &&
                                cadastroUsuario
                                    .containsKey(usuarioController.text) &&
                                cadastroUsuario
                                    .containsValue(senhaController.text)) {
                            } else
                              return "Digite sua senha";
                          },
                          obscureText: true,
                          maxLength: 5,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: ('Senha'),
                            hintText: ('Digite seu senha'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 95, right: 95),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Theme.of(context).primaryColor,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Acessar",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                print("validou");
                                userAtual = usuarioController.text;
                                acesso();
                              } else {
                                print("Não validou");
                                alerta();
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 43),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CriarConta())),
                        child: Text(
                          "Criar uma conta",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Venha fazer parte do nosso mundo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
