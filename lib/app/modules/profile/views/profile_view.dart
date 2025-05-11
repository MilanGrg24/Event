import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
                  radius: 60,
                  backgroundImage: AssetImage(
                    "assets/images/event_logo.png",
                    bundle: null,
                  ),
                ),
                SizedBox(height: 6.0),
                const Text(
                  "Sejan",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Divider(thickness: 1),
                ListTile(
                  onTap: () {
                    Get.to(() => const EditProfile());
                  },
                  leading: Icon(Icons.edit, color: Colors.deepPurple),
                  title: const Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_right, color: Colors.deepPurple),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed("favourite");
                  },
                  leading: Icon(Icons.favorite, color: Colors.deepPurple),
                  title: const Text(
                    "Favourite",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_right, color: Colors.deepPurple),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => OrderHistory());
                  },
                  leading: Icon(Icons.history, color: Colors.deepPurple),
                  title: const Text(
                    "Booking History",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_right, color: Colors.deepPurple),
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
                                  color: Colors.deepPurple,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                final storage = GetStorage();
                                storage.remove('token'); // Clear token
                                Get.offAll(() => LoginView());
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  leading: Icon(Icons.lock, color: Colors.deepPurple),
                  title: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_right, color: Colors.deepPurple),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
