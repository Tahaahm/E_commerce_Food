// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_with_backend/utils/colors.dart';
import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:e_commerce_with_backend/widgets/account_widget.dart';
import 'package:e_commerce_with_backend/widgets/app_icon.dart';
import 'package:e_commerce_with_backend/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimentions.height20),
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              iconColor: Colors.white,
              sizeIcon: Dimentions.height30 * 2.5,
              backgroundColor: AppColors.mainColor,
              size: Dimentions.height15 * 10,
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.person,
                          iconColor: Colors.white,
                          sizeIcon: Dimentions.height25,
                          backgroundColor: AppColors.mainColor,
                          size: Dimentions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "Taha",
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.phone,
                          iconColor: Colors.white,
                          sizeIcon: Dimentions.height25,
                          backgroundColor: AppColors.yellowColor,
                          size: Dimentions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "07517812988",
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.email,
                          iconColor: Colors.white,
                          sizeIcon: Dimentions.height25,
                          backgroundColor: AppColors.yellowColor,
                          size: Dimentions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "tahaahmad837@gmail.com",
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.location_on,
                          iconColor: Colors.white,
                          sizeIcon: Dimentions.height25,
                          backgroundColor: AppColors.yellowColor,
                          size: Dimentions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "File in your address",
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.message_outlined,
                          iconColor: Colors.white,
                          sizeIcon: Dimentions.height25,
                          backgroundColor: Colors.redAccent,
                          size: Dimentions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "Taha",
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.message_outlined,
                          iconColor: Colors.white,
                          sizeIcon: Dimentions.height25,
                          backgroundColor: Colors.redAccent,
                          size: Dimentions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "Taha",
                        )),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
