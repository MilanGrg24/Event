import 'package:eventapp/app/modules/register/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController loginController = Get.put(LoginController());
  final RxBool isPasswordHidden = true.obs; // reactive password hide/show

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: Obx(() {
            return loginController.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.size.height * 0.5,
                      width: Get.size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/images.jpeg"),
                          fit: BoxFit.fill,
                        ),
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(6.0),
                        //   bottomRight: Radius.circular(6.0),
                        // ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Login to your account',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Enter your email',
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.deepPurpleAccent,
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  ),
                                ),
                                errorStyle: const TextStyle(color: Colors.red),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                    width: 1,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!GetUtils.isEmail(value)) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: passwordController,
                              obscureText: isPasswordHidden.value,
                              decoration: InputDecoration(
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  ),
                                ),
                                errorStyle: const TextStyle(color: Colors.red),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                    width: 1,
                                  ),
                                ),
                                labelText: 'Enter your password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.deepPurpleAccent,
                                ),
                                suffixIcon: IconButton(
                                  color: Colors.deepPurpleAccent,
                                  icon: Icon(
                                    isPasswordHidden.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    isPasswordHidden.value =
                                        !isPasswordHidden.value;
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 32),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  loginController.login(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  );
                                }
                              },
                              child: Container(
                                height: Get.size.height * 0.07,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have account?"),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => RegisterView());
                                  },
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
          }),
        ),
      ),
    );
  }
}

          
              //     child: Form(
              //       key: _formKey,
              //       child: Column(
              //         spacing: 16.0,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'Welcome Back!',
              //             style: TextStyle(
              //               color: Colors.amber,
              //               fontSize: 24,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           Text(
              //             'Login to your account',
              //             style: TextStyle(
              //               color: Colors.deepPurpleAccent,
              //               fontSize: 16,
              //               fontWeight: FontWeight.w500,
              //             ),
              //           ),
              //           CustomTextFormField(
              //             backgroundColor: Colors.transparent,
              //             prefixIcon: Icon(
              //               Icons.mail_rounded,
              //               color: Colors.amberAccent,
              //             ),
              //             hintText: 'Enter your email address',
              //             fieldKey: ,
              //             controller: loginController.emailTextEditingController,
              //             customValidator:
              //                 (email) => loginValidationController.emailValidator(
              //                   email?.trim() ?? "",
              //                 ),
              //           ),
              //           CustomTextFormField(
              //             backgroundColor: Colors.transparent,
              //             prefixIcon: Icon(Icons.lock, color: Colors.amberAccent),
              //             hintText: 'Enter your password',
              //             suffixIcon: IconButton(
              //               splashRadius: 20,
              //               iconSize: 22,
              //               icon:
              //                   loginController.ishidden.value
              //                       ? const Icon(Icons.visibility)
              //                       : const Icon(Icons.visibility_off_rounded),
              //               onPressed: () {
              //                 loginController.ishidden.value =
              //                     !loginController.ishidden.value;
              //               },
              //             ),
              //             fieldKey: _passwordFormFieldKey,
              //             isPassword: loginController.ishidden.value,
              //             controller: loginController.passwordTextEditingController,
              //             customValidator:
              //                 (password) => loginValidationController
              //                     .passwordValidator(password ?? ""),
              //           ),
              //           CustomButton(
              //             // onTap: () async {
              //             //   Get.showOverlay(
              //             //     asyncFunction: () async {
              //             //       await loginController.handleUserLogin(_formKey);
              //             //     },
              //             //     loadingWidget: Transform.scale(
              //             //       scale: 1.4,
              //             //       child: SizedBox(
              //             //         height: Get.size.height / 1.3,
              //             //         child: Center(
              //             //           child: CircularProgressIndicator(
              //             //             backgroundColor: Colors.deepPurpleAccent,
              //             //             valueColor: AlwaysStoppedAnimation<Color>(
              //             //               Colors.deepPurple,
              //             //             ),
              //             //           ),
              //             //         ),
              //             //       ),
              //             //     ),
              //             //   );
              //             //   //   loginController.checkLogin();
              //             // },
              //             onTap: () {
              //               Get.to(HomeView());
              //             },
          
              //             text: "Login",
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "Dont't have account?",
              //       style: TextStyle(fontWeight: FontWeight.w700),
              //     ),
          
              //     TextButton(
              //       onPressed: () {
              //         Navigator.of(context).push(
              //           MaterialPageRoute(
              //             builder: (context) => const RegisterView(),
              //           ),
              //         );
              //       },
              //       child: Text(
              //         "Register!",
              //         style: TextStyle(color: Colors.deepPurpleAccent),
              //       ),
              //     ),
              //   ],
              // ),
