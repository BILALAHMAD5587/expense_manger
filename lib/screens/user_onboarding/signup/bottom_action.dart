import 'package:expenser_app/ui/custom_widgets/ui_helper.dart';
import 'package:flutter/material.dart';

List<Widget> getChildren(title, subtitle, action, width, context){
  return [
    Text(title,
    style: width > 500 ? mTextStylr19(
      fontweight: FontWeight.w300,
      mColor: Theme.of(context).shadowColor) : mTextStylr12(
      fontweight: FontWeight.w300,
      mColor: Theme.of(context).shadowColor),
    ),
    TextButton(onPressed: action,
        child: Text(subtitle,
        style: width > 500 ? mTextStylr19(
          fontweight: FontWeight.w300,
          mColor: Theme.of(context).canvasColor) : mTextStylr12(
          fontweight: FontWeight.w300,
          mColor: Theme.of(context).canvasColor),)),
  ];
}