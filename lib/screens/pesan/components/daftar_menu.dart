import 'package:flutter/material.dart';
import 'package:kaku/components/product_card.dart';
import 'package:kaku/models/Product.dart';
import 'package:kaku/screens/home/controllers/daftar_menu.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class DaftarMenu extends StatefulWidget {
  @override
  _DaftarMenu createState() => _DaftarMenu();
}

class _DaftarMenu extends State<DaftarMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Daftar Menu", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: <Widget>[
              for (int i = 0; i < daftarMenu.length; i += 2)
                Row(
                  children: [
                    ProductCard(product: daftarMenu[i]),
                    if (i + 1 < daftarMenu.length)
                      ProductCard(product: daftarMenu[i + 1]),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                ),
            ],
          ),
        )
      ],
    );
  }
}
