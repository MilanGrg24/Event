import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteTile extends StatelessWidget {
  const FavouriteTile({
    super.key,
    required this.name,
    required this.price,
    this.image,
    this.onTap,
    this.favoriteID,
  });
  final String name;
  final String price;
  final String? image;
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: Get.size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                // image: DecorationImage(
                //   image: AssetImage('assets/images/event3.jpeg'),
                //   fit: BoxFit.fill,
                // ),
                image: DecorationImage(
                  image: AssetImage("assets/images.event1.jpeg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rs. "
                        "$price",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: Colors.deepPurple,
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize: const Size(60, 30),
                        ),
                        onPressed: onTap,
                        child: const Text(
                          "View",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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
