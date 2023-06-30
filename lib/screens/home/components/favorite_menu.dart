import 'package:flutter/material.dart';
import 'package:kaku/components/product_card.dart';
import 'package:kaku/models/Product.dart';
import 'package:kaku/screens/home/controllers/favorite_nemu.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class FavoriteMenu extends StatefulWidget {
  @override
  _FavoriteMenu createState() => _FavoriteMenu();
}

class _FavoriteMenu extends State<FavoriteMenu> {
  var data = favoriteGet();
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
          child: Row(
            children: [
              ...List.generate(
                data.length,
                (index) {
                  if (data[index].isPopular)
                    return ProductCard(product: data[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
