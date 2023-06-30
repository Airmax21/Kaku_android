import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title, description;
  final List<String> images;
  final String jenis;
  final double rating;
  final String price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.jenis,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: '1',
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    jenis: 'ss',
    title: "Wireless Controller for PS4™",
    price: '64.99',
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: '2',
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    jenis: 'ss',
    title: "Nike Sport White - Man Pant",
    price: '50.5',
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: '3',
    images: [
      "assets/images/glap.png",
    ],
    jenis: 'ss',
    title: "Gloves XC Omega - Polygon",
    price: '36.55',
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: '4',
    images: [
      "assets/images/wireless headset.png",
    ],
    jenis: 'ss',
    title: "Logitech Head",
    price: '20.20',
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
