import 'package:flutter/cupertino.dart';

class Request{

  String client_id = 'linkbank-ddca07';
  String secret_id = '260110f9-1207-402b-88ff-6447f6f8fe0b';
  String auth_appi = 'auth.truelayer.com';
  String api = 'api.truelayer.com';
  String auth_dialog_code;
  Request(this.auth_dialog_code);

  getter(){

      return print('$auth_dialog_code');

  }
}