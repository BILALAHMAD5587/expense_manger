import 'package:expenser_app/ui/custom_widgets/ui_helper.dart';
import 'package:flutter/material.dart';

class CustomRoundedBtn extends StatelessWidget {
  VoidCallback callback;
  String text;
  Widget? mchild;

  CustomRoundedBtn({required this.callback, required this.text, this.mchild});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.09,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21)
          ),
          primary: Theme.of(context).brightness==Brightness.light ? MyColors.secoundryBColor : MyColors.secondryWColor,
        ),
        child: mchild ?? Text(
          text,
          style: mTextStylr16(
              mColor: Theme.of(context).backgroundColor,
              fontweight: FontWeight.w800),
        ),
      ),
    );
  }
}
