import 'package:kaku/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> signIn() async {
  final response = await http.get(Uri.parse('${kEndpoint}login'));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    
  } else {
    
  }
}