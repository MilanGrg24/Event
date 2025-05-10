import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favourite_controller.dart';

class FavouriteView extends GetView<FavouriteController> {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourite'), centerTitle: true),
      body: Obx(() {
        if (controller.favouriteList.isEmpty) {
          return Center(child: Text("No Favourites Added"));
        }

        return ListView.builder(
          itemCount: controller.favouriteList.length,
          itemBuilder: (context, index) {
            var event = controller.favouriteList[index];
            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6.0,
              ),
              child: ListTile(
                leading: Image.network(
                  event.imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(event.title),
                subtitle: Text("Rs. ${event.price}"),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    controller.removeFromFavourite(event);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
