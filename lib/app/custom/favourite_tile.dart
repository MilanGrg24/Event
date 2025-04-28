import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteTile extends StatelessWidget {
  FavouriteTile({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
    this.onTap,
    this.favoriteID,
  }) : super(key: key);
  final String name;
  final String price;
  final String image;
  final VoidCallback? onTap;
  final int? favoriteID;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.grey, offset: Offset(0, 1), blurRadius: 6),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Column(
          children: [
            Container(
              height: Get.size.height * 0.2,
              width: Get.size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  IconButton(
                    splashRadius: 2,
                    onPressed: () {
                      // favouriteController.deleteFavorite(favoriteID!);
                    },
                    icon: Icon(Icons.favorite, color: Colors.deepPurple),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.deepPurpleAccent,
                          ),
                          child: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Rs. "
                    "${price}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
