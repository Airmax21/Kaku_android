import 'package:flutter/material.dart';
import 'package:kaku/screens/cart/controllers/cart.dart';
import 'package:kaku/screens/home/components/daftar_menu.dart';
import 'package:kaku/sharedprefrences.dart';

import '../../../size_config.dart';
import 'sambutan_user.dart';
import 'home_header.dart';

class Body extends StatefulWidget {
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Set a delay of 3 seconds before showing the main content
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
    cartGet();
  }

  @override
  void dispose() {
    super.dispose();
    deleteLocalStorage('meja_id');
    deleteLocalStorage('order_id');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            SambutanUser(),
            // SizedBox(height: getProportionateScreenWidth(10)),
            // FavoriteMenu(),
            SizedBox(height: getProportionateScreenWidth(30)),
            DaftarMenu(),
            SizedBox(height: SizeConfig.screenHeight * 0.08)
          ],
        ),
      ),
    );
  }
}
