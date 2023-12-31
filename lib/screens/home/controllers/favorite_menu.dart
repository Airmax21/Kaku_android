import 'package:flutter/material.dart';
import 'package:kaku/constants.dart';
import 'package:http/http.dart' as http;
import 'package:kaku/models/Product.dart';
import 'package:kaku/sharedprefrences.dart';
import 'dart:convert';

List<Product> favMenu = [];

List<Product> favoriteGet() {
  favMenu = [];
  favoriteFetch();
  return favMenu;
}

Future<void> favoriteFetch() async {
  var url = Uri.parse('${kEndpoint}favorite_menu');

  var response = await http.get(url);
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    for (var dat in data) {
      favMenu.add(Product(
        id: dat['menu_id'],
        images: [kEndpointGambar + dat['gambar']],
        jenis: dat['jenis_id'],
        title: dat['menu_nm'],
        price: dat['harga'],
        description: dat['deskripsi'],
        rating: 4.8,
        isFavourite: true,
        isPopular: true,
      ));
    }
  }
}
