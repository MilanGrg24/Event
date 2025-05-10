import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../login/views/login_view.dart';
import '../controllers/event_detail_controller.dart';
import 'BookingFormScreen.dart';

class EventDetailView extends GetView<EventDetailController> {
  final int? eventId;
  final EventDetailController eventDetailController = Get.put(
    EventDetailController(),
  );
  EventDetailView({super.key, this.eventId});

  @override
  Widget build(BuildContext context) {
    controller.fetchEventDetail(eventId!);
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<EventDetailController>(
          builder: (_) {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller.eventDetail == null) {
              return Center(child: Text('No event found.'));
            }

            var event = controller.eventDetail!;
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: Get.size.height * 0.6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        filterQuality: FilterQuality.high,
                        image: NetworkImage(event.imageUrl),
                        fit: BoxFit.cover,
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
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.amber,
                              ),
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
                              event.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              spacing: 6.0,
                              children: [
                                Icon(Icons.location_on, size: 16),
                                Text(
                                  event.country,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Row(
                          children: [
                            Text(
                              "Category:",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              event.category.title,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.0),
                        Row(
                          children: [
                            Icon(Icons.date_range, size: 16),
                            SizedBox(width: 4.0),
                            Row(
                              spacing: 6.0,
                              children: [
                                Text(
                                  event.startDate,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Center(
                          child: Text(
                            "-------------------------------------------------------------------------------------",
                          ),
                        ),
                        Text(
                          "Description:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          event.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
                                  event.price.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    // color: AppColors.paletteB,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                final token = GetStorage().read('token');

                                if (token == null) {
                                  Get.snackbar(
                                    "Login Required",
                                    "Please login to book this event",
                                  );
                                  Get.to(() => LoginView());
                                } else {
                                  Get.to(
                                    () => BookingFormScreen(eventId: event.id),
                                  );
                                }
                              },

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
            );
          },
        ),
      ),
    );
  }
}
