import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom/custom_textfield.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 14.0,
            ),
            child: Column(
              children: [
                Container(
                  height: Get.size.height * 0.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/event_logo.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Icon(Icons.edit, color: Colors.amberAccent),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                CustomTextFormField(
                  prefixIcon: Icon(Icons.person, color: Colors.deepPurple),
                  hintText: 'Enter your Full name',
                  // fieldKey: _emailFormFieldKey,
                  // controller: loginController.emailTextEditingController,
                  // customValidator: (user_email) =>
                  //     loginValidationController.emailValidator(
                  //   user_email?.trim() ?? "",
                  // ),
                ),
                SizedBox(height: 12),
                CustomTextFormField(
                  prefixIcon: Icon(
                    Icons.mail_rounded,
                    color: Colors.deepPurple,
                  ),
                  hintText: 'Enter your email',
                  // fieldKey: _emailFormFieldKey,
                  // controller: loginController.emailTextEditingController,
                  // customValidator: (user_email) =>
                  //     loginValidationController.emailValidator(
                  //   user_email?.trim() ?? "",
                  // ),
                ),
                SizedBox(height: 12),
                CustomTextFormField(
                  prefixIcon: Icon(
                    Icons.contact_phone,
                    color: Colors.deepPurple,
                  ),
                  hintText: 'Enter your contact',
                  // fieldKey: _emailFormFieldKey,
                  // controller: loginController.emailTextEditingController,
                  // customValidator: (user_email) =>
                  //     loginValidationController.emailValidator(
                  //   user_email?.trim() ?? "",
                  // ),
                ),
                SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    // Get.to(() => CreateAccountView());
                  },
                  child: Container(
                    height: Get.size.height * 0.07,
                    width: Get.size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
