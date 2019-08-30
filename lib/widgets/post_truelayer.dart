import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostRequest extends StatelessWidget {
  String accessToken;
  Map data;

  PostRequest(this.accessToken);


    Future<String> getData() async{
    http.Response response = await http.get(Uri.encodeFull("https://api.truelayer.com/data/v1/me"), 
    headers: {
                "Authorization": "Bearer $accessToken",
    }
    );
    print(response.body);
    Map data = json.decode(response.body);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Resposta'),
            centerTitle: true,
            backgroundColor: Colors.red,
          ),
          body: Container(
        color: Colors.white,
        child: Center(
          child: Text("oie"),
        ),
      ),
    );
  }
}