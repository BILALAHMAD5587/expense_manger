import 'package:expenser_app/screens/user_onboarding/signup/bottom_action.dart';
import 'package:expenser_app/screens/user_onboarding/signup/signup_page.dart';
import 'package:expenser_app/ui/custom_widgets/custom_logo_stack.dart';
import 'package:expenser_app/ui/custom_widgets/custom_rounded_btn.dart';
import 'package:expenser_app/ui/custom_widgets/custom_text_filed.dart';
import 'package:expenser_app/ui/custom_widgets/ui_helper.dart';
import 'package:flutter/material.dart';

import '../../home/home_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userNameController = TextEditingController();
  var passController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height > 700
              ? mainUI()
              : SingleChildScrollView(
                  child: mainUI(),
                )
          : Row(
              children: [
                Expanded(
                    child: Container(
                      width: double.infinity,
                  height: double.infinity,
                  child: CustomLogoStack(50),
                  color: Theme.of(context).brightness == Brightness.light
                      ? MyColors.bgBColor
                      : MyColors.bgWColor,
                )),
                Expanded(
                    child: MediaQuery.of(context).size.height > 700
                        ? mainUI()
                        : SingleChildScrollView(
                            child: mainUI(),
                          ))
              ],
            ),
    );
  }

  Widget mainUI() {
    var width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      print(constraints.maxWidth);
      print(constraints.minWidth);
      return Center(
          child: Padding(
        padding: const EdgeInsets.all(21),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomLogoStack(width > 700 ? 50 : 34),
              SizedBox(
                height: 11,
              ),
              Text(
                "Hello, Again",
                style: width > 700
                    ? mTextStylr43(
                        fontweight: FontWeight.w800,
                        mColor: Theme.of(context).canvasColor)
                    : mTextStylr26(
                        fontweight: FontWeight.w800,
                        mColor: Theme.of(context).canvasColor),
              ),
              SizedBox(
                height: 11,
              ),
              Text(
                "Welcome Back You\`ve been missed",
                style: width > 700
                    ? mTextStylr16(
                        fontweight: FontWeight.w300,
                        mColor: Theme.of(context).shadowColor)
                    : mTextStylr12(
                        fontweight: FontWeight.w400,
                        mColor: Theme.of(context).shadowColor),
              ),

              //////////////////////////////////Username and Password TextFiled////////////////////////
              SizedBox(
                height: 21,
              ),
              CustomTextFiled(
                errorMsg: 'Enter Email ',
                hint: 'Email Here',
                mcontroller: userNameController,
                isPassword: false,
                mfillcolor: Theme.of(context).brightness == Brightness.light
                    ? MyColors.secondryWColor
                    : MyColors.secoundryBColor,
                micon: Icons.email_outlined,
              ),
              SizedBox(
                height: 11,
              ),
              CustomTextFiled(
                errorMsg: 'Enter Your PAssword',
                hint: 'PassWord Here',
                mcontroller: passController,
                isPassword: true,
                mfillcolor: Theme.of(context).brightness == Brightness.light
                    ? MyColors.secondryWColor
                    : MyColors.secoundryBColor,
                micon: Icons.lock_open_outlined,
              ),
              SizedBox(
                height: 25,
              ),
              CustomRoundedBtn(callback: () {


                if (userNameController.text.toString().isNotEmpty
                && passController.text.toString().isNotEmpty){
                  //login process
                } else {
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text('Stop'),
                      content: Text('Please Fill all the required blanks!!'),
                    );
                  });
                }




                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data'))
                  );
                }

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));


              }, text: "Login"),
              SizedBox(
                height: 12,
              ),

              MediaQuery.of(context).size.width > 270
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Create a New Account',
                            style: width > 700
                                ? mTextStylr19(
                                    fontweight: FontWeight.w300,
                                    mColor: Theme.of(context).shadowColor)
                                : mTextStylr12(
                                    fontweight: FontWeight.w400,
                                    mColor: Theme.of(context).shadowColor)),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SiginUp_Page()));
                          },
                          child: Text('Sign Up Now',
                              style: width > 700
                                  ? mTextStylr19(
                                      fontweight: FontWeight.w300,
                                      mColor: Theme.of(context).canvasColor)
                                  : mTextStylr12(
                                      fontweight: FontWeight.w400,
                                      mColor: Theme.of(context).canvasColor)),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Create a New Account',
                            style: width > 700
                                ? mTextStylr19(
                                    fontweight: FontWeight.w300,
                                    mColor: Theme.of(context).shadowColor)
                                : mTextStylr12(
                                    fontweight: FontWeight.w400,
                                    mColor: Theme.of(context).shadowColor)),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SiginUp_Page()));
                          },
                          child: Text('Sign Up Now',
                              style: width > 700
                                  ? mTextStylr19(
                                      fontweight: FontWeight.w300,
                                      mColor: Theme.of(context).canvasColor)
                                  : mTextStylr12(
                                      fontweight: FontWeight.w400,
                                      mColor: Theme.of(context).canvasColor)),
                        ),
                        if (constraints.maxWidth > 400)
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: getChildren(
                                  'Already have an Account, ', 'Login Now', () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ));
                              }, width, context))
                        else
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: getChildren(
                                'Already have an Account, ', 'Login now', () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                            }, width, context),
                          )
                      ],
                    )
            ],
          ),
        ),
      ));
    });
  }
}
