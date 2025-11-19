import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myButton_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myCard_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/mySpace_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myText_widget.dart';
import 'package:pas_mobile_11pplg2_01/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(14),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(50),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/profile.jpeg',
                          ),
                          radius: 50,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: MytextWidget(
                            text: 'Severus Melvin',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MycardWidget(
                    text: "11 PPLG 2",
                    textStyle: TextStyle(fontSize: 18),
                    leadingIcon: Icon(Icons.class_rounded),
                  ),
                  MycardWidget(
                    text: "+62-859-2663-7138",
                    textStyle: TextStyle(fontSize: 18),
                    leadingIcon: Icon(Icons.phone),
                  ),
                  MycardWidget(
                    text: 'smelvinrichard@gmail.com',
                    textStyle: TextStyle(fontSize: 18),
                    leadingIcon: Icon(Icons.email),
                  ),
                ],
              ),
              MybuttonWidget(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                text: 'Logout',
                onPressed: profileController.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
