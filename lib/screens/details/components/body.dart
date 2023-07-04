import 'package:flutter/material.dart';
import 'package:kaku/components/default_button.dart';
import 'package:kaku/models/Product.dart';
import 'package:kaku/screens/cart/controllers/cart.dart';
import 'package:kaku/screens/details/controller/order.dart';
import 'package:kaku/screens/pesan/pesan_screen.dart';
import 'package:kaku/sharedprefrences.dart';
import 'package:kaku/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: widget.product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.05,
                          right: SizeConfig.screenWidth * 0.05,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(8),
                        ),
                        child: DefaultButton(
                          text: "Add to Cart",
                          press: () async {
                            String? order_id =
                                await readLocalStorage('order_id');
                            String? jumlah = await readLocalStorage('jumlah');
                            addOrder(order_id, widget.product.id, jumlah);
                            await deleteLocalStorage('jumlah');
                            Navigator.pushNamed(context, PesanScreen.routeName);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
