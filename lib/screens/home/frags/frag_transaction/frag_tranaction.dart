import 'package:expenser_app/bloc/expenseCatType/expense_type_bloc.dart';
import 'package:expenser_app/bloc/expense_bloc.dart';
import 'package:expenser_app/models/cat_model.dart';
import 'package:expenser_app/ui/constant.dart';
import 'package:expenser_app/ui/custom_widgets/custom_rounded_btn.dart';
import 'package:expenser_app/ui/custom_widgets/db_helper.dart';
import 'package:expenser_app/ui/custom_widgets/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../models/date_wise_expense.dart';
import '../../../../models/expense_model.dart';
import '../../../add_expense/add_expense_screen.dart';

class FragTransaction extends StatefulWidget {
  @override
  State<FragTransaction> createState() => _FragTransactionState();
}

class _FragTransactionState extends State<FragTransaction> {
  bool isLight = true;

  List<ExpenseModel> arrExpense = [];

  List<DateWiseExpenseModel> arrData = [];

  var frmt = DateFormat.y();
  var frmt2 = DateFormat.MMMMd();
  var frmt3 = DateFormat.MMMM();
  var frmt4 = DateFormat.d();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ExpenseBloc>(context).add(FetchExpenseEvent());
    BlocProvider.of<ExpenseTypeBloc>(context).add(FetchAllCatExpenseType());
  }

  @override
  Widget build(BuildContext context) {
    isLight = Theme
        .of(context)
        .brightness == Brightness.light;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme
                .of(context)
                .colorScheme.background,
            body: BlocBuilder<ExpenseBloc, ExpenseState>(
              builder: (ctx, state) {
                if (state is ExpenseLoadingState) {
                  return CircularProgressIndicator();
                } else if (state is ExpenseLoadedState) {
                  if (state.arrExpense.isNotEmpty) {
                    arrExpense = state.arrExpense;

                    List<String> arrUniqueDates = [];

                    for (ExpenseModel expense in arrExpense) {
                      var date = DateTime.parse(expense.time!);

                      var eachDate =
                          '${date.year}-${date.month.toString().length==1?'0${date.month}' : '${date.month}'}-${date.day}';
                      print(eachDate);

                      if (arrUniqueDates.contains(eachDate)) {
                        arrUniqueDates.add(eachDate);
                      }
                    }
                    //print(arrUniqueDates);

                    filterExpensesDateWise(arrUniqueDates);


                    return MediaQuery
                        .of(context)
                        .orientation ==
                        Orientation.portrait
                        ? portraitUI(context, arrData)
                        : landscapeUI();
                  } else {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'No Expense Yet!',
                              style: mTextStylr43(
                                  mColor: Colors.white,
                                  fontweight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 21,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddExpensePage(
                                              arrExpense.isNotEmpty
                                                  ? arrExpense[
                                              arrExpense.length - 1]
                                                  .bal!
                                                  : 0.0),
                                    ));
                              },
                              child: CircleAvatar(
                                backgroundColor: isLight
                                    ? MyColors.bgBColor
                                    : MyColors.bgWColor,
                                child: Icon(
                                  Icons.add,
                                  color: isLight
                                      ? MyColors.bgWColor
                                      : MyColors.bgBColor,
                                  size: 21,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                } else if (state is ExpeseErrorState) {
                  return Container();
                }
                return Container();
              },
            )));
  }


  void filterExpensesDateWise(List<String> uniqueDates) {
    /*var frmt = DateFormat.y();
    var frmt2 = DateFormat.MMMMd();

    var todayMonthYear =
        '${frmt.format(DateTime.now())} ${frmt2.format(DateTime.now())}';*/

    /*var today = DateTime.now().day;
    var month = DateTime.now().month;
    var year = DateTime.now().year;*/
    /*arrExpense.where((expense) {
      if(expense.time!.contains(todayMonthYear)){
        arrTransaction.add(expense);
      }
      return true;
    });*/
    /*arrExpense.removeWhere((expense) {
      if (expense.time!.contains(todayMonthYear)) {
        return true;
      } else {
        return false;
      }
    });*/

    /*var totalOtherAmt = 0.0;
    for (ExpenseModel expense in arrExpense) {
      if (expense.expenseType == 'Debit') {
        totalOtherAmt += expense.amt!;
      } else {
        totalOtherAmt -= expense.amt!;
      }
    }*/

    /*arrData.add(DateWiseExpenseModel(
        Date: 'Prev', amt: totalDayAmt.toString(), arrExpenses: arrExpense));*/

    arrData.clear();


    for (String date in uniqueDates) {
      List<ExpenseModel> eachDayTransaction = [];


      for (ExpenseModel expense in arrExpense) {
        print(expense.time);
        print(date);
        if (expense.time!.contains(date)) {
          eachDayTransaction.add(expense);
        }
      }

      var eachDayAmt = 0.0;

      for (ExpenseModel trans in eachDayTransaction) {
        if (trans.expenseType == 'Debit') {
          eachDayAmt += trans.amt!;
        } else {
          eachDayAmt -= trans.amt!;
        }
      }

      var todayDate =
          '${frmt.format(DateTime.now())} ${frmt2.format(DateTime.now())}';

      var YesterdayDate =
          '${frmt.format(DateTime.now())} ${frmt3.format(DateTime.now())} ${int
          .parse(frmt4.format(DateTime.now())) - 1}';

      if (date == todayDate) {
        date = 'Today';
      } else if (date==YesterdayDate) {
        date = 'Yesterday';
      }

      arrData.add(DateWiseExpenseModel(
          Date: date,
          amt: eachDayAmt.toString(),
          arrExpenses: eachDayTransaction));
    }
  }

  Widget landscapeUI() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                totalBalanceUI(),
                SizedBox(
                  height: 21,
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: CustomRoundedBtn(
                    callback: () {},
                    text: '',
                    mchild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,
                            color: isLight
                                ? MyColors.bgWColor
                                : MyColors.bgBColor),
                        Text(
                          'Add Expense',
                          style: mTextStylr16(
                              mColor: isLight
                                  ? MyColors.bgWColor
                                  : MyColors.bgBColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
        Expanded(flex: 1, child: allTransactionUI(BuildContext))
      ],
    );
  }

  Widget portraitUI(BuildContext context,
      List<DateWiseExpenseModel> arrDayWiseExpense) {
    return Column(
      children: [
        Expanded(flex: 1, child: addTransactionUI(context)),
        Expanded(flex: 7, child: totalBalanceUI()),
        Expanded(flex: 11, child: allTransactionUI(arrDayWiseExpense)),
      ],
    );
  }

  Widget dayWiseTransactiodItem(Map dayTransDetails,) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dayTransDetails['Date'],
                  style: mTextStylr12(
                      mColor: isLight
                          ? MyColors.secoundryBColor
                          : MyColors.secondryWColor),
                ),
                Text(
                  '\$ ${dayTransDetails['amt']}',
                  style: mTextStylr12(
                      mColor: isLight
                          ? MyColors.secoundryBColor
                          : MyColors.secondryWColor),
                )
              ],
            ),
          ),
          BlocBuilder<ExpenseTypeBloc, ExpenseTypeState>(
            builder: (context, state) {
              if (state is ExpenseTypeLoadedState) {
                print(dayTransDetails);
                return ListView.builder(
                  itemCount: dayTransDetails['arrExpenses'].length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      detailTransactionItem(
                          (dayTransDetails['arrExpenses'][index] as ExpenseModel)
                              .toMap(),
                          state.arrExpenseType),
                );
              } else if (state is ExpenseTypeLoadingState) {
                return CircularProgressIndicator();
              }
              return Container();
            },
          ),
          //SizedBox(height: 21,),
          SizedBox(
            height: 21,
          ),
        ],
      ),
    );
  }

  Widget detailTransactionItem(Map detailedTrans,
      List<CatModel> arrExpenseType) {
    var catImgPath = '';
    // arrExpenseType.map((cat){
    //   if(cat.catId== detailedTrans[DBHelper.EXPENSE_COLUM_CAT_ID]){
    //     catImgPath = cat.imgPath;
    //   }
    // } );
    for (CatModel cat in arrExpenseType) {
      if (cat.catId == detailedTrans[DBHelper.EXPENSE_COLUM_CAT_ID]) {
        catImgPath = cat.imgPath;
      }
    }

    return ListTile(
      leading: Image.asset(catImgPath),
      title: Text(
        detailedTrans[DBHelper.EXPENSE_COLUM_TITLE],
        style: mTextStylr12(
            mColor: isLight ? MyColors.textWColor : MyColors.textBColor,
            fontweight: FontWeight.bold),
      ),
      subtitle: Text(
        detailedTrans[DBHelper.EXPENSE_COLUM_DESC],
        style: mTextStylr12(
            mColor: isLight ? MyColors.textWColor : MyColors.textBColor),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '\$ ${detailedTrans[DBHelper.EXPENSE_COLUM_AMT]}',
            style: mTextStylr12(
                mColor: isLight ? MyColors.textWColor : MyColors.textBColor,
                fontweight: FontWeight.bold),
          ),
          Text(
            '\$ ${detailedTrans[DBHelper.EXPENSE_COLUM_BAL]}',
            style: mTextStylr12(
                mColor: isLight ? MyColors.textWColor : MyColors.textBColor),
          )
        ],
      ),
    );
  }

  Widget addTransactionUI(context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddExpensePage(arrExpense.isNotEmpty
                            ? arrExpense[arrExpense.length - 1].bal!
                            : 0.0),
                  ));
            },
            child: CircleAvatar(
              backgroundColor: isLight ? MyColors.bgBColor : MyColors.bgWColor,
              child: Icon(
                Icons.add,
                color: isLight ? MyColors.bgWColor : MyColors.bgBColor,
                size: 21,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget totalBalanceUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Spent this week',
            style: mTextStylr12(
                mColor: isLight
                    ? MyColors.secoundryBColor
                    : MyColors.secondryWColor)),
        RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '\$ ',
                  style: mTextStylr26(
                      mColor: isLight
                          ? MyColors.secoundryBColor
                          : MyColors.secondryWColor,
                      fontweight: FontWeight.bold)),
              TextSpan(
                  text: '9999',
                  style: mTextStylr52(
                      mColor: isLight
                          ? MyColors.secoundryBColor
                          : MyColors.secondryWColor,
                      fontweight: FontWeight.bold)),
              TextSpan(
                  text: '.50',
                  style: mTextStylr26(
                      mColor: isLight
                          ? MyColors.secoundryBColor
                          : MyColors.secondryWColor))
            ]))
      ],
    );
  }

  Widget allTransactionUI(arrDayWiseExpense) {
    return ListView.builder(
      itemCount: arrDayWiseExpense.length,
      itemBuilder: (context, index) =>
          dayWiseTransactiodItem(
              (arrDayWiseExpense[index] as DateWiseExpenseModel).toMap()),
    );
  }
}
