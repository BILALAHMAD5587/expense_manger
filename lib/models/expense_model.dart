import 'package:expenser_app/ui/custom_widgets/db_helper.dart';

class ExpenseModel {
  int? eid;
  String? title;
  String? desc;
  double? amt;
  double? bal;
  int? catId;
  String? expenseType;
  String? time;

  ExpenseModel(
      {this.eid,
      this.title,
      this.desc,
      this.amt,
      this.bal,
      this.catId,
      this.expenseType,
      this.time});

  factory ExpenseModel.formMap(Map<String, dynamic> map) {
    return ExpenseModel(
        eid: map[DBHelper.EXPENSE_COLUM_ID],
        title: map[DBHelper.EXPENSE_COLUM_TITLE],
        desc: map[DBHelper.EXPENSE_COLUM_DESC],
        amt: map[DBHelper.EXPENSE_COLUM_AMT],
        bal: map[DBHelper.EXPENSE_COLUM_BAL],
        catId: map[DBHelper.EXPENSE_COLUM_CAT_ID],
        expenseType: map[DBHelper.EXPENSE_COLUM_ECPENSE_TYPE],
        time: map[DBHelper.EXPENSE_COLUM_TIME]);
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.EXPENSE_COLUM_TITLE: title,
      DBHelper.EXPENSE_COLUM_DESC: desc,
      DBHelper.EXPENSE_COLUM_AMT: amt,
      DBHelper.EXPENSE_COLUM_BAL: bal,
      DBHelper.EXPENSE_COLUM_CAT_ID: catId,
      DBHelper.EXPENSE_COLUM_ECPENSE_TYPE: expenseType,
      DBHelper.EXPENSE_COLUM_TIME: time
    };
  }
}
