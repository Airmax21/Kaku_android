import 'package:flutter/material.dart';
import 'package:kaku/components/product_card.dart';
import 'package:kaku/models/Product.dart';
import 'package:kaku/screens/home/controllers/favorite_nemu.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class DaftarMenu extends StatefulWidget {
  @override
  _DaftarMenu createState() => _DaftarMenu();
}

class _DaftarMenu extends State<DaftarMenu> {
  var data1 = favoriteGet();

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
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              ...List.generate(
                3,
                (x) {
                  debugPrint(x.toString());
                  // return Row(
                  //   children: [
                  //     ...List.generate(
                  //       2,
                  //       (index) {
                  //         var max = data1.length;
                  //         if ((index * (x + 1)) < max)
                  //           return ProductCard(product: data1[index * (x + 1)]);

                  //         return SizedBox(
                  //             width: getProportionateScreenWidth(
                  //                 0)); // here by default width and height is 0
                  //       },
                  //     ),
                  //     SizedBox(width: getProportionateScreenWidth(20)),
                  //     SizedBox(height: SizeConfig.screenHeight * 0.08)
                  //   ],
                  // );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
