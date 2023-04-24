import 'package:expenser_app/bloc/expenseCatType/expense_type_bloc.dart';
import 'package:expenser_app/bloc/expense_bloc.dart';
import 'package:expenser_app/models/cat_model.dart';
import 'package:expenser_app/models/expense_model.dart';
import 'package:expenser_app/ui/custom_widgets/custom_rounded_btn.dart';
import 'package:expenser_app/ui/custom_widgets/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddExpensePage extends StatefulWidget {
  double balanceTillNow;

  AddExpensePage(this.balanceTillNow);

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  var amtController = TextEditingController();
  var titleController = TextEditingController();
  var descController = TextEditingController();

  var _selectedIndex = -1;

  List<CatModel> arrExpenseType = [];

  var defaultDropDownValue = 'Debit';

  List<String> arrTransType = ['Debit', 'Credit'];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ExpenseTypeBloc>(context).add(FetchAllCatExpenseType());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.bgBColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: mTextStylr16(mColor: Colors.black),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Expense',
                        style: mTextStylr16(mColor: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextField(
                        style: mTextStylr52(mColor: MyColors.textBColor),
                        controller: amtController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.currency_rupee_outlined,
                            size: 25,
                            color: MyColors.textBColor,
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    TextField(
                        style: mTextStylr16(mColor: MyColors.textBColor),
                        controller: titleController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Add Title',
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                        )),
                    SizedBox(
                      height: 21,
                    ),
                    TextField(
                        textAlign: TextAlign.end,
                        style: mTextStylr16(mColor: MyColors.textBColor),
                        controller: descController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Add Desc',
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                        )),
                    SizedBox(
                      height: 21,
                    ),
                    BlocListener<ExpenseTypeBloc, ExpenseTypeState>(
                      listener: (context, state) {
                        if (state is ExpenseTypeLoadedState) {
                          arrExpenseType = state.arrExpenseType;
                          setState(() {});
                        }
                      },
                      child: Visibility(
                        visible: arrExpenseType.isNotEmpty,
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(21),
                                            topRight: Radius.circular(21))),
                                    builder: (context) {
                                      return GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: arrExpenseType.length,
                                          gridDelegate:
                                              SliverGridDelegateWithMaxCrossAxisExtent(
                                                  maxCrossAxisExtent: 90),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                _selectedIndex = index;
                                                setState(() {});
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                    arrExpenseType[index]
                                                        .imgPath),
                                              ),
                                            );
                                          });
                                    });
                              },
                              child: _selectedIndex == -1
                                  ? Text(
                                      'Select Expense Type',
                                      style: mTextStylr16(mColor: Colors.grey),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Selected -'),
                                        Image.asset(
                                            arrExpenseType[_selectedIndex]
                                                .imgPath)
                                      ],
                                    )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    DropdownButton(
                        icon: Icon(Icons.arrow_drop_down_circle_outlined),
                        dropdownColor: Colors.black,
                        value: defaultDropDownValue,
                        items: arrTransType
                            .map((value) => DropdownMenuItem(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value,
                                      style: mTextStylr16(mColor: Colors.white),
                                    ),
                                  ),
                                  value: value,
                                ))
                            .toList(),
                        onChanged: (dynamic selectedValue) {
                          defaultDropDownValue = selectedValue;
                          setState(() {});
                        }),
                    SizedBox(
                      height: 21,
                    ),
                    BlocListener<ExpenseBloc, ExpenseState>(
                      listener: (context, state) {
                        if (state is ExpenseLoadingState) {
                          print('Loading');
                        } else if (state is ExpenseLoadedState) {
                          Navigator.pop(context);
                        }
                      },
                      child: CustomRoundedBtn(
                          callback: () {
                            /*var frmt = DateFormat.y();
                            var frmt2 = DateFormat.MMMMd();
                            var frmt3 = DateFormat.Hms();
                            var currentTime =
                                '${frmt.format(DateTime.now())} ${frmt2.format(DateTime.now())} '
                                '${frmt3.format(DateTime.now())}';*/
                            var newBalance = 0.0;

                            if(defaultDropDownValue==arrTransType[0]){
                              //Debit
                              newBalance = widget.balanceTillNow - double.parse(
                                amtController.text.toString());
                            } else {
                              //Credit
                              newBalance = widget.balanceTillNow +  double.parse(
                                  amtController.text.toString());
                            }

                            if (_selectedIndex != -1) {
                              BlocProvider.of<ExpenseBloc>(context).add(
                                  NewExpenseEvent(ExpenseModel(
                                      title: titleController.text,
                                      desc: descController.text,
                                      amt: double.parse(
                                          amtController.text.toString()),
                                      bal: newBalance,
                                      expenseType: defaultDropDownValue,
                                      catId:
                                          arrExpenseType[_selectedIndex].catId,
                                      time: DateTime.now().toString())));
                            }
                          },
                          text: 'Add'),
                    ),
                    /*
                       *  InkWell(
                          onTap: () async {
                            var dateTime = await showDatePicker(
                                context: context,
                                initialDate: _seletedDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime.now());

                            _seletedDate = dateTime ?? DateTime.now();
                            setState(() {});
                          },
                          child: Text(
                            _seletedDate.toString(),
                            style: mTextStylr19(mColor: Colors.black),
                          ),
                        ),*/
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
