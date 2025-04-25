import 'package:eventapp/app/custom/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../custom/custom_textfield.dart';
import '../../home/views/home_view.dart';
import '../../register/views/register_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: Get.size.height * 0.55,
              width: Get.size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/images.jpeg"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6.0),
                  bottomRight: Radius.circular(6.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12.0,
              ),
              child: Form(
                // key: _formKey,
                child: Column(
                  spacing: 16.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Login to your account',
                      style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomTextFormField(
                      backgroundColor: Colors.transparent,
                      prefixIcon: Icon(
                        Icons.mail_rounded,
                        color: Colors.amberAccent,
                      ),
                      hintText: 'Enter your email address',
                    ),
                    CustomTextFormField(
                      backgroundColor: Colors.transparent,
                      prefixIcon: Icon(Icons.lock, color: Colors.amberAccent),
                      hintText: 'Enter your password',
                    ),
                    CustomButton(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ),
                        );
                      },
                      text: "Login",
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont't have account?",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterView(),
                      ),
                    );
                  },
                  child: Text(
                    "Register!",
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
