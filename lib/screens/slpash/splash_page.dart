import 'dart:async';

import 'package:expenser_app/screens/user_onboarding/login/login_page.dart';
import 'package:expenser_app/screens/user_onboarding/signup/signup_page.dart';
import 'package:expenser_app/ui/custom_widgets/custom_logo_stack.dart';
import 'package:flutter/material.dart';

class Splashp_Page extends StatefulWidget {
  const Splashp_Page({Key? key}) : super(key: key);

  @override
  State<Splashp_Page> createState() => _Splashp_PageState();
}

class _Splashp_PageState extends State<Splashp_Page> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SiginUp_Page(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: CustomLogoStack(50),
        ));
  }
}
