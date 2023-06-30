import 'package:http/http.dart' as http;
import 'package:kaku/constants.dart';
import 'package:kaku/sharedprefrences.dart';

Future<bool> cekOtp(String kode_otp) async {
  final username = await readLocalStorage('username');
  var url = Uri.parse('${kEndpoint}signup/cek_otp');
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var body = {'kode_otp': '${kode_otp}', 'username': '${username}'};

  var response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<void> expOtp() async {
  final username = await readLocalStorage('username');
  var url = Uri.parse('${kEndpoint}signup/exp_otp');
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var body = {'username': '${username}'};

  var response = await http.post(url, headers: headers, body: body);
  print(response.body);
}

Future<void> reSendOtp() async {
  final username = await readLocalStorage('username');
  final email = await readLocalStorage('email');
  var url = Uri.parse('${kEndpoint}signup/resend_otp');
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var body = {'email': '${email}', 'username': '${username}'};

  var response = await http.post(url, headers: headers, body: body);
  print(response.body);
}
