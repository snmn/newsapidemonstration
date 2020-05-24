import 'dart:convert';

import 'package:assignment/model/news.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

import '../static.dart';
import 'package:http/http.dart' as http;

class GetApi
{

  static Future<bool> _checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    }
    else {
      return true;
    }
  }
  // ignore: missing_return
  static Future<news> getnewsdata(BuildContext context) async {
    bool connection = await _checkConnectivity();
    if (connection == false) {
    } else {
      try {
        http.Response data = await http.get(
            Uri.encodeFull(StaticValue.baseurl + "&apiKey="+StaticValue.apikey

            ),
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json',
            });
        var jsonData = json.decode(data.body);

          var newsdata = news.fromJson(jsonData);

        return newsdata;
      } catch (e) {
        print(e);
        return null;
      }
    }
  }
}