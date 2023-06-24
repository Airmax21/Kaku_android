import 'package:http/http.dart' as http;
import 'package:kaku/constants.dart';

Future<void> signUpPost(String username, String pass, String nama, String email,
    String alamat, String no_telp) async {
  var url = Uri.parse('${kEndpoint}'); 
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  }; 
  var body = {
    'username': '${username}',
    'pass': '${pass}',
    'nama': '${nama}',
    'email': '${email}',
    'alamat': '${alamat}',
    'no_telp': '${no_telp}'
  }; 

  var response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    print('Response: ${response.body}');
  } else {
    print('Error: ${response.statusCode}');
  }
}
