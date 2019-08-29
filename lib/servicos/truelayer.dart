import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/data/mock_bank.dart';
import 'package:url_launcher/url_launcher.dart';

class TrueLayer extends StatefulWidget {
  @override
  _TrueLayerState createState() => _TrueLayerState();
}

class _TrueLayerState extends State<TrueLayer> {

  final _tokenController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Material(
          child: Scaffold(
        appBar: new AppBar(
          title: Text('mockbank'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
            body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
          child: Center(
            child: SingleChildScrollView(
                          child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset('images/mb.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 110, right: 110, top: 20),
                    child: new RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Get Token",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      onPressed: (){
                        setState(() {
                          _launchURL();
                        });
                      }
                    ),
                  ),
                  Text('Via TrueLayer', style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50, top: 15,bottom: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber.shade200,
                      ),
                      child: TextField(
                        controller: _tokenController,
                        decoration: InputDecoration(
                          labelText: 'Insira o token de acesso aqui!',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: new RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),),
                            color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Acessar conta",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(width: 10,),
                            Icon(
                              Icons.account_balance,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        onPressed: () => Request(_tokenController.text).getter(),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://auth.truelayer.com/?response_type=code&client_id='
    +'linkbank-ddca07&nonce=1148396925&scope=accounts%20products%20beneficiaries&redirect_uri='
    +'https://console.truelayer.com/redirect-page&enable_mock='
    +'true&enable_oauth_providers=false&enable_open_banking_providers='
    +'false&enable_credentials_sharing_providers=false';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
