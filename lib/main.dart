import 'package:expenser_app/bloc/expenseCatType/expense_type_bloc.dart';
import 'package:expenser_app/bloc/expense_bloc.dart';
import 'package:expenser_app/screens/home/home_page.dart';
import 'package:expenser_app/screens/slpash/splash_page.dart';
import 'package:expenser_app/screens/user_onboarding/signup/signup_page.dart';
import 'package:expenser_app/ui/custom_widgets/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [BlocProvider<ExpenseBloc>(
      create: (BuildContext context) => ExpenseBloc(),),
    BlocProvider<ExpenseTypeBloc>(
        create: (BuildContext context) => ExpenseTypeBloc()),
  ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: createMaterialColor(MyColors.bgBColor),
          backgroundColor: MyColors.bgBColor,
          canvasColor: MyColors.bgWColor,
          shadowColor: MyColors.LighttextBColor),
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: createMaterialColor(MyColors.bgWColor),
          backgroundColor: MyColors.bgWColor,
          canvasColor: MyColors.bgBColor,
          shadowColor: MyColors.LighttextWColor),
      home: HomePage(),
    );
  }
}
