import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../custom/custom_button.dart';
import '../../../custom/custom_textfield.dart';
import '../../login/views/login_view.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.grey.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 10.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Full name:",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.deepPurple,
                fontSize: 14,
              ),
            ),
            CustomTextFormField(
              backgroundColor: Colors.white12,
              prefixIcon: Icon(Icons.person, color: Colors.amberAccent),
              hintText: 'Enter your full name',
            ),
            SizedBox(height: 4.0),
            Text(
              "Email Address:",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.deepPurple,
                fontSize: 14,
              ),
            ),
            CustomTextFormField(
              backgroundColor: Colors.white12,
              prefixIcon: Icon(Icons.mail, color: Colors.amberAccent),
              hintText: 'Enter your email address',
            ),
            SizedBox(height: 4.0),
            Text(
              "Phone Number:",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.deepPurple,
                fontSize: 14,
              ),
            ),
            CustomTextFormField(
              backgroundColor: Colors.white12,
              prefixIcon: Icon(Icons.phone, color: Colors.amberAccent),
              hintText: 'Enter your phone number',
            ),
            SizedBox(height: 4.0),
            Text(
              "Password:",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.deepPurple,
                fontSize: 14,
              ),
            ),
            CustomTextFormField(
              backgroundColor: Colors.white12,
              prefixIcon: Icon(Icons.lock, color: Colors.amberAccent),
              hintText: 'Enter your password',
            ),
            SizedBox(height: 6.0),
            CustomButton(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              text: "Register",
            ),
          ],
        ),
      ),
    );
  }
}
