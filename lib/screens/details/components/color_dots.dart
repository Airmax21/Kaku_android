import 'package:flutter/material.dart';
import 'package:kaku/components/rounded_icon_btn.dart';
import 'package:kaku/models/Product.dart';
import 'package:kaku/sharedprefrences.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  _ColorDots createState() => _ColorDots();
}

class _ColorDots extends State<ColorDots> {
  int jumlah = 0;

  @override
  void initState() {
    readjumlah();
    super.initState();
  }

  void readjumlah() async {
    String? jumlah1 = await readLocalStorage('jumlah');
    jumlah = int.parse(jumlah1.toString());
  }

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          // ...List.generate(
          //   product.jenis.length,
          //   (index) => ColorDot(
          //     color: product.jenis[index],
          //     isSelected: index == selectedColor,
          //   ),
          // ),
          Spacer(),
          Spacer(),
          Text(
            'Jumlah',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () async {
              setState(() {
                if (jumlah > 0) {
                  jumlah -= 1;
                }
              });
              await setLocalStorage('jumlah', jumlah.toString());
              String? tes = await readLocalStorage('jumlah');
              debugPrint(tes);
            },
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Text(jumlah.toString()),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () async {
              setState(() {
                jumlah = jumlah + 1;
              });
              await setLocalStorage('jumlah', jumlah.toString());
              String? tes = await readLocalStorage('jumlah');
              debugPrint(tes);
            },
          ),
        ],
      ),
    );
  }
}
