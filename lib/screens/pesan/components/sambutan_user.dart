import 'package:flutter/material.dart';
import 'package:kaku/constants.dart';
import 'package:kaku/sharedprefrences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../size_config.dart';

class SambutanUser extends StatefulWidget {
  @override
  _SambutanUser createState() => _SambutanUser();
}

class _SambutanUser extends State<SambutanUser> {
  late String result;

  @override
  void initState() {
    super.initState();
    convert();
  }

  Future<void> convert() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedText = prefs.getString(
        'meja_id'); // Mengambil nilai dari SharedPreferences dengan kunci 'textKey'

    setState(() {
      result = storedText ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(5),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: kPrimaryColor),
          children: [
            TextSpan(
                text: "No Meja \n",
                style: TextStyle(fontSize: getProportionateScreenWidth(20))),
            TextSpan(
              text: result,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
