

import 'package:expenser_app/screens/user_onboarding/login/login_page.dart';
import 'package:expenser_app/screens/user_onboarding/signup/bottom_action.dart';
import 'package:expenser_app/ui/custom_widgets/custom_logo_stack.dart';
import 'package:expenser_app/ui/custom_widgets/custom_rounded_btn.dart';
import 'package:expenser_app/ui/custom_widgets/custom_text_filed.dart';
import 'package:expenser_app/ui/custom_widgets/ui_helper.dart';
import 'package:flutter/material.dart';

class SiginUp_Page extends StatefulWidget {
  const SiginUp_Page({Key? key}) : super(key: key);

  @override
  State<SiginUp_Page> createState() => _SiginUp_PageState();
}

class _SiginUp_PageState extends State<SiginUp_Page> {
  var nameController = TextEditingController();
  var emailcontroller = TextEditingController();
  var passController = TextEditingController();
  var ConfirmPassController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.height > 700
       ? mainUI() : SingleChildScrollView(
        child: mainUI(),)
      : Row(
        children: [
          Expanded(child: Container(
            child: CustomLogoStack(50),
            color: Theme.of(context).brightness == Brightness.light
            ? MyColors.bgBColor
            : MyColors.bgWColor,
          )),
          Expanded(child: MediaQuery.of(context).size.height > 700
          ? mainUI()
          : SingleChildScrollView(child: mainUI(),))
        ],
      ),
    );
  }

  Widget mainUI(){
    var width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints){
      print(constraints.maxWidth);
      print(constraints.maxWidth);

      return Center(child:
        Padding(padding: const EdgeInsets.all(21),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomLogoStack(width > 500 ? 50 : 34),
              SizedBox(height: 21,),
              Text('Get Started',
              style: constraints.maxWidth > 500 ? mTextStylr43(
                fontweight: FontWeight.bold,
                mColor: Theme.of(context).canvasColor) : mTextStylr26(
                fontweight: FontWeight.bold,
                mColor: Theme.of(context).canvasColor),),
              SizedBox(height: 11,),
              Text('Start managing Your Expense Today!',
                style: constraints.maxWidth > 500 ? mTextStylr19(
                    fontweight: FontWeight.w300,
                    mColor: Theme.of(context).canvasColor) : mTextStylr12(
                    fontweight: FontWeight.w300,
                    mColor: Theme.of(context).canvasColor),),
              ///////////////////////////////////Uname And Password////////////////////
                SizedBox(height: 21),
              CustomTextFiled(
                errorMsg: 'Please Enter Your Name',
                  mcontroller: nameController,
                  mfillcolor: Theme.of(context).brightness == Brightness.light
                  ? MyColors.secondryWColor
                  : MyColors.secoundryBColor,
                  micon: Icons.account_circle_outlined,
                  isPassword: false,
                  hint: 'Name Hare...'),
              SizedBox(height: 11,),
              CustomTextFiled(
                errorMsg: 'Please Enter Your Email',
                  mcontroller: emailcontroller,
                  mfillcolor: Theme.of(context).brightness == Brightness.light
                      ? MyColors.secondryWColor
                      : MyColors.secoundryBColor,
                  micon: Icons.email_outlined,
                  isPassword: false,
                  hint: 'Email Here..'),
              SizedBox(height: 11,),
              CustomTextFiled(
                errorMsg: 'Chouse Your Passeord',
                  mcontroller: passController,
                  mfillcolor: Theme.of(context).brightness == Brightness.light
                      ? MyColors.secondryWColor
                      : MyColors.secoundryBColor,
                  micon: Icons.lock_open_outlined,
                  isPassword: true,
                  hint: 'Password here'),
              SizedBox(height: 11,),
              CustomTextFiled(
                  errorMsg: 'Chouse Your Confirm Passeord',
                  mcontroller: ConfirmPassController,
                  mfillcolor: Theme.of(context).brightness == Brightness.light
                      ? MyColors.secondryWColor
                      : MyColors.secoundryBColor,
                  micon: Icons.lock_open_outlined,
                  isPassword: true,
                  hint: 'Confirm Password here'),

              SizedBox(height: 25,),
              CustomRoundedBtn(callback: (){


                if (nameController.text.toString().isNotEmpty
                    && passController.text.toString().isNotEmpty
                && emailcontroller.text.toString().isNotEmpty
                 && passController.text.toString().isNotEmpty
                && ConfirmPassController.text.toString().isNotEmpty){
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
              }, text: 'Sign Up'),
              SizedBox(height: 11,),
              if (constraints.maxWidth > 400 )
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: getChildren('Already have an Account, ', 'Login Now', (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder:
                            (context) =>  LoginPage(),
                        ));}, width, context)
                )
      else Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getChildren('Already have an Account, ', 'Login now', (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage(),));
                }, width, context),
              )


            ],
          ),
        ),
        ),
      );
    }
    );
  }
}
