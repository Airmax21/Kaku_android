import 'package:flutter/material.dart';
import 'package:kaku/constants.dart';
import 'package:http/http.dart' as http;
import 'package:kaku/sharedprefrences.dart';
import 'dart:convert';

Future<bool> signInPost(String username, String pass) async {
  var url = Uri.parse('${kEndpoint}signin');
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var body = {'pass': '${pass}', 'username': '${username}'};

  var response = await http.post(url, headers: headers, body: body);
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    await setLocalStorage('username', data['username']);
    await setLocalStorage('id', data['id']);
    await setLocalStorage('fullname', data['fullname']);
    return true;
  } else {
    return false;
  }
}
