import 'package:flutter/material.dart';
import 'package:kaku/constants.dart';
import 'package:http/http.dart' as http;
import 'package:kaku/sharedprefrences.dart';
import 'dart:convert';

Future<bool> pesanGet(String link) async {
  var url = Uri.parse(link);
  String? username = await readLocalStorage('username');
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var body = {'username': '${username}'};
  var response = await http.post(url, headers: headers, body: body);
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    await setLocalStorage('meja_id', data['meja_id']);
    await setLocalStorage('order_id', data['order_id']);
    return true;
  } else {
    return false;
  }
}
