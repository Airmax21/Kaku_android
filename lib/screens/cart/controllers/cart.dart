import 'package:flutter/material.dart';
import 'package:kaku/constants.dart';
import 'package:http/http.dart' as http;
import 'package:kaku/models/Cart.dart';
import 'package:kaku/models/Product.dart';
import 'package:kaku/sharedprefrences.dart';
import 'dart:convert';

List<Cart> cart = [];
String? harga = '';

void cartGet() async {
  cart = [];
  harga = '';
  await cartFetch();
  await hargaFetch();
}

Future<void> cartFetch() async {
  var url = Uri.parse('${kEndpoint}cartget');
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  String? order_id = await readLocalStorage('order_id');
  var body = {
    'order_id': '${order_id}',
  };
  var response = await http.post(url, headers: headers, body: body);
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    for (var dat in data) {
      cart.add(Cart(
          product: Product(
            id: dat['menu_id'],
            images: [kEndpointGambar + dat['gambar']],
            jenis: dat['jenis_id'],
            title: dat['menu_nm'],
            price: dat['harga'],
            description: dat['deskripsi'],
            rating: 4.8,
            isFavourite: false,
            isPopular: true,
          ),
          numOfItem: int.parse(dat['jumlah'])));
    }
  }
}

Future<void> hargaFetch() async {
  var url = Uri.parse('${kEndpoint}orderget');
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  String? order_id = await readLocalStorage('order_id');
  var body = {
    'order_id': '${order_id}',
  };
  var response = await http.post(url, headers: headers, body: body);
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    harga = data['grand_total'];
  }
}
