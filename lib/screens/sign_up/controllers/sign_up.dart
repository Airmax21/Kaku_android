import 'package:http/http.dart' as http;
import 'package:kaku/constants.dart';
import 'package:kaku/sharedprefrences.dart';

Future<bool> signUpPost(String username, String pass, String nama, String email,
    String alamat, String no_telp) async {
  var url = Uri.parse('${kEndpoint}signup');
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
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
    await setLocalStorage('username', username);
    await setLocalStorage('email', email);
    await setLocalStorage('fullname', nama);
    return true;
  } else {
    return false;
  }
}

Future<bool> cekUsername(String username) async {
  var url = Uri.parse('${kEndpoint}signup/cek_username');
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var body = {'username': '${username}'};
  var response = await http.post(url, headers: headers, body: body);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
