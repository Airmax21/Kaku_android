import 'package:flutter/material.dart';
import 'package:kaku/constants.dart';
import 'package:http/http.dart' as http;
import 'package:kaku/sharedprefrences.dart';
import 'dart:convert';

Future<bool> addOrder(String? order_id, String menu_id, String? jumlah) async {
  var url = Uri.parse('${kEndpoint}addcart');
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var body = {
    'order_id': '${order_id}',
    'menu_id': '${menu_id}',
    'jumlah': '${jumlah}'
  };
  var response = await http.post(url, headers: headers, body: body);
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
