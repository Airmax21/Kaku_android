import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kaku/models/Cart.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(cart.product.images[0],
                    cacheHeight: 400, cacheWidth: 400),
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text:
                    "${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ').format(int.parse(cart.product.price))}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${cart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
            SizedBox(height: 5),
            Text(
                '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ').format((int.parse(cart.product.price) * cart.numOfItem))}')
          ],
        )
      ],
    );
  }
}
