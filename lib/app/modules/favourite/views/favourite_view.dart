import 'package:eventapp/app/custom/favourite_tile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favourite_controller.dart';

class FavouriteView extends GetView<FavouriteController> {
  const FavouriteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourite'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: FavouriteTile(
              name: "Live Music",
              price: 1200.toString(),
              image: "assets/images/event2.jpeg",
            ),
          ),
        ],
      ),
    );
  }
}
