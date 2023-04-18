import 'expense_model.dart';

class DateWiseExpenseModel {
  String Date;
  String amt;
  List<ExpenseModel> arrExpenses;

  DateWiseExpenseModel(
      {required this.Date, required this.amt, required this.arrExpenses});


  factory DateWiseExpenseModel.formMap(Map<String, dynamic> map) {
    return DateWiseExpenseModel(
        Date: map['Date'],
        amt: map['amt'],
        arrExpenses: map['arrExpenses'],
       );
  }

  Map<String, dynamic> toMap() {
    return {
      'Date': Date,
      'amt': amt,
      'arrExpenses': arrExpenses,
    };
  }

}
