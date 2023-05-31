// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_local_variable, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:math';

import 'package:e_commerce_with_backend/controllers/auth_controller.dart';
import 'package:e_commerce_with_backend/model/signup_body_model.dart';
import 'package:e_commerce_with_backend/pages/auth/sign_up_page.dart';
import 'package:e_commerce_with_backend/routes/route_helper.dart';
import 'package:e_commerce_with_backend/utils/colors.dart';
import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:e_commerce_with_backend/widgets/app_text_field.dart';
import 'package:e_commerce_with_backend/widgets/big_text.dart';
import 'package:e_commerce_with_backend/widgets/custom_load.dart';
import 'package:e_commerce_with_backend/widgets/show_custom_message.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      String password = passwordController.text.trim();
      String email = emailController.text.trim();

      if (password.isEmpty) {
        showCustomerSnackBar("Type in your password", title: "Password");
      } else if (email.isEmpty) {
        showCustomerSnackBar("Type in your email Address",
            title: "Email Address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomerSnackBar("Type in valid email address",
            title: "Valid email address");
      } else if (password.length < 6) {
        showCustomerSnackBar("Password can not be less than six character",
            title: "password");
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getcartPage());
            showCustomerSnackBar("All went well", colors: AppColors.mainColor);
          } else {
            showCustomerSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(
          builder: (loginController) {
            return !loginController.isLoading
                ? SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimentions.screenHeight * 0.05,
                        ),
                        Container(
                          height: Dimentions.screenHeight * 0.25,
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: Dimentions.height40 * 2,
                              backgroundImage:
                                  AssetImage("assets/image/logo part 1.png"),
                            ),
                          ),
                        ),

                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(left: Dimentions.width20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Hello",
                                style: TextStyle(
                                  fontSize: Dimentions.height20 * 3 +
                                      Dimentions.height10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Sign into your account",
                                style: TextStyle(
                                  fontSize: Dimentions.height20,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //email
                        AppTextField(
                          textController: emailController,
                          hintText: "Email",
                          icon: Icons.email,
                        ),
                        SizedBox(
                          height: Dimentions.height20,
                        ),
                        //password
                        AppTextField(
                          textController: passwordController,
                          hintText: "Password",
                          icon: Icons.password,
                          isObscure: true,
                        ),
                        SizedBox(
                          height: Dimentions.height20,
                        ),

                        SizedBox(
                          height: Dimentions.height10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Sign into your account",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: Dimentions.height20),
                              ),
                            ),
                            SizedBox(
                              width: Dimentions.width20,
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimentions.height30,
                        ),
                        GestureDetector(
                          onTap: () {
                            _login(loginController);
                          },
                          child: Container(
                            height: Dimentions.screenHeight / 13,
                            width: Dimentions.screenWidth / 2,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimentions.height30),
                            ),
                            child: Center(
                                child: BigText(
                              text: "Sign Up",
                              size: Dimentions.height30,
                              color: Colors.white,
                            )),
                          ),
                        ),
                        SizedBox(
                          height: Dimentions.height10,
                        ),

                        SizedBox(
                          height: Dimentions.screenHeight * 0.05,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Don't have an account?",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimentions.height10 * 1.6),
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.to(
                                          () => SignUpPage(),
                                          transition: Transition.fadeIn,
                                        ),
                                  text: "Create",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                  )
                : CustomLoader();
          },
        ));
  }
}
