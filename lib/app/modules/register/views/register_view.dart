import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../custom/custom_button.dart';
import '../../../custom/custom_textfield.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});
  final _formKey = GlobalKey<FormState>();
  final RegisterController registerController = Get.put(RegisterController());
  final RxBool isPasswordHidden = true.obs;
  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.deepPurple,
      fontSize: 14,
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.grey.shade200,
      ),
      body: Obx(
        () =>
            controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    // 👈 Add this Form widget
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 8.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Full Name
                          Text("Full name:", style: labelStyle),
                          CustomTextFormField(
                            backgroundColor: Colors.white12,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.amberAccent,
                            ),
                            hintText: 'Enter your full name',
                            onChanged: (value) => controller.name.value = value,
                            validator:
                                (value) =>
                                    value == null || value.isEmpty
                                        ? 'Full name is required'
                                        : null,
                          ),
                          SizedBox(height: 8),

                          // Email
                          Text("Email Address:", style: labelStyle),
                          CustomTextFormField(
                            backgroundColor: Colors.white12,
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.amberAccent,
                            ),
                            hintText: 'Enter your email address',
                            onChanged:
                                (value) => controller.email.value = value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              if (!GetUtils.isEmail(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 8),

                          // Phone
                          Text("Phone Number:", style: labelStyle),
                          CustomTextFormField(
                            backgroundColor: Colors.white12,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.amberAccent,
                            ),
                            hintText: 'Enter your phone number',
                            onChanged:
                                (value) => controller.phone.value = value,
                            validator:
                                (value) =>
                                    value == null || value.length < 10
                                        ? 'Enter valid phone number'
                                        : null,
                          ),
                          SizedBox(height: 8),

                          // Password
                          Text("Password:", style: labelStyle),
                          Obx(
                            () => CustomTextFormField(
                              backgroundColor: Colors.white12,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.amberAccent,
                              ),
                              hintText: 'Enter your password',
                              obscureText: isPasswordHidden.value,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordHidden.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () => isPasswordHidden.toggle(),
                              ),
                              onChanged:
                                  (value) => controller.password.value = value,
                              validator:
                                  (value) =>
                                      value == null || value.length < 6
                                          ? 'Password must be at least 6 characters'
                                          : null,
                            ),
                          ),
                          SizedBox(height: 8),

                          // Confirm Password
                          Text("Confirm Password:", style: labelStyle),
                          Obx(
                            () => CustomTextFormField(
                              backgroundColor: Colors.white12,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.amberAccent,
                              ),
                              obscureText: isPasswordHidden.value,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordHidden.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () => isPasswordHidden.toggle(),
                              ),
                              hintText: 'Enter confirm password',
                              onChanged:
                                  (value) =>
                                      controller.passwordConfirmation.value =
                                          value,
                              validator:
                                  (value) =>
                                      value != controller.password.value
                                          ? 'Passwords do not match'
                                          : null,
                            ),
                          ),
                          SizedBox(height: 16),

                          // Register Button
                          CustomButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                controller.registerUser();
                              }
                            },
                            text: "Register",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
      ),
    );
  }
}
