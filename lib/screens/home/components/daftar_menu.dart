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
  var data1 = daftarGet();

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
              for (int i = 0; i < data1.length; i += 2)
                Row(
                  children: [
                    ProductCard(product: data1[i]),
                    if (i + 1 < data1.length)
                      ProductCard(product: data1[i + 1]),
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
