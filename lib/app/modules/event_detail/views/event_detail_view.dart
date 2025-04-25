import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  const EventDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: Get.size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // image: NetworkImage(
                    //   AppApi.imageUrl + productDetailModel.image,
                    // ),
                    image: AssetImage("assets/images/images.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Icon(Icons.arrow_back, color: Colors.amber),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Column(
                  spacing: 6.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Title",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          spacing: 6.0,
                          children: [
                            Icon(Icons.location_on, size: 14),
                            Text(
                              "Pokhara",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "Description:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "ieuf iwiowehoi  ohewo howheogf nohgfo kj kjsse  e fef dfd fkjf kjf kjf ewhof wofhowh ognrkdf bnreoegn erigei  erfbw ",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quantity",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0, 1),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: const Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0, 1),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Rs.",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "1200",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                // color: AppColors.paletteB,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                spacing: 8.0,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  Text(
                                    "Book",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
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
      ),
    );
  }
}
