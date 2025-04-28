import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../login/views/login_view.dart';
import '../controllers/profile_controller.dart';
import 'order_history.dart';
import 'profile_edit.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 12.0,
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/event_logo.png",
                      ),
                      backgroundColor: Colors.transparent,
                      radius: 24,
                    ),
                    SizedBox(width: 70),
                    Text(
                      "My Profile",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    "assets/images/event1.jpeg",
                    bundle: null,
                  ),
                ),
                const Text(
                  "Sejan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Divider(thickness: 1),
                ListTile(
                  onTap: () {
                    Get.to(() => const EditProfile());
                  },
                  leading: Icon(Icons.edit, color: Colors.deepPurpleAccent),
                  title: const Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed("favourite");
                  },
                  leading: Icon(Icons.favorite, color: Colors.deepPurpleAccent),
                  title: const Text(
                    "Favourite",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => OrderHistory());
                  },
                  leading: Icon(Icons.history, color: Colors.deepPurpleAccent),
                  title: const Text(
                    "Order History",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.deepPurpleAccent,
                  ),
                  title: const Text(
                    "About Us",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: const Center(child: Text('Event Hub')),
                          content: const Text(
                            'Are you sure you want to logout?',
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'No',
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginView(),
                                  ),
                                );
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.deepPurpleAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  leading: Icon(Icons.lock, color: Colors.deepPurpleAccent),
                  title: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
