// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_local_variable, prefer_interpolation_to_compose_strings, unused_element, no_leading_underscores_for_local_identifiers

import 'package:e_commerce_with_backend/controllers/auth_controller.dart';
import 'package:e_commerce_with_backend/model/signup_body_model.dart';
import 'package:e_commerce_with_backend/pages/auth/sign_in_page.dart';
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

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t2.png",
      "f.png",
      "g.png",
    ];
    void _registeration(AuthController authController) {
      String name = nameController.text.trim();
      String password = passwordController.text.trim();
      String email = emailController.text.trim();
      String phone = phoneController.text.trim();
      if (name.isEmpty) {
        showCustomerSnackBar("Type in your name", title: "Name");
      } else if (password.isEmpty) {
        showCustomerSnackBar("Type in your password", title: "Password");
      } else if (email.isEmpty) {
        showCustomerSnackBar("Type in your email Address",
            title: "Email Address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomerSnackBar("Type in valid email address",
            title: "Valid email address");
      } else if (phone.isEmpty) {
        showCustomerSnackBar("Type in your phone", title: "Phone");
      } else if (password.length < 6) {
        showCustomerSnackBar("Password can not be less than six character",
            title: "password");
      } else {
        showCustomerSnackBar(
          "All went well",
          title: "Pefect",
          colors: AppColors.mainColor,
        );
        SignUpBody signUpBody = SignUpBody(
            email: email, name: name, password: password, phone: phone);
        authController.registeration(signUpBody).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getinitial());
          } else {
            showCustomerSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(
          builder: (controller) {
            return !controller.isLoading
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
                              backgroundColor: Colors.white,
                              radius: Dimentions.height40 * 2,
                              backgroundImage:
                                  AssetImage("assets/image/logo part 1.png"),
                            ),
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
                          isObscure: true,
                          icon: Icons.password,
                        ),
                        SizedBox(
                          height: Dimentions.height20,
                        ),
                        //name
                        AppTextField(
                          textController: nameController,
                          hintText: "Name",
                          icon: Icons.person,
                        ),
                        SizedBox(
                          height: Dimentions.height20,
                        ),
                        AppTextField(
                          textController: phoneController,
                          hintText: "Phone",
                          icon: Icons.phone,
                        ),
                        SizedBox(
                          height: Dimentions.height40,
                        ),
                        GestureDetector(
                          onTap: () {
                            _registeration(controller);
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => SignInPage(),
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.back(),
                              text: "Have an account already?",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimentions.height20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimentions.screenHeight * 0.05,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Sign up using one of the following methods",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimentions.height10 * 1.6),
                          ),
                        ),

                        Wrap(
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: Dimentions.height30,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                    "assets/image/" + signUpImages[index]),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : CustomLoader();
          },
        ));
  }
}
