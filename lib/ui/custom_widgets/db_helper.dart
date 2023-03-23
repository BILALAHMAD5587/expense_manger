import 'package:expenser_app/models/cat_model.dart';
import 'package:expenser_app/models/expense_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  //EXpense Table
  static const String EXPENSE_TABLE = 'expense';
  static const String EXPENSE_COLUM_ID = 'eid';
  static const String EXPENSE_COLUM_TITLE = 'title';
  static const String EXPENSE_COLUM_DESC = 'desc';
  static const String EXPENSE_COLUM_AMT = 'amount';
  static const String EXPENSE_COLUM_CAT_ID = 'cat_id';
  static const String EXPENSE_COLUM_ECPENSE_TYPE = 'expense_type';
  static const String EXPENSE_COLUM_TIME = 'time';

  //Catgory Table
  static const String CAT_TABLE = 'expense_cat';
  static const String CAT_COLUM_ID = 'cat_id';
  static const String CAT_COLUM_NAME =  'name';
  static const String CAT_COULM_PATH = 'img_path';

  Future<Database> openDB () async {
    var directory = await getApplicationDocumentsDirectory();
     await directory.create(recursive: true);
     var path = '${directory.path}expense_db.db';

     return await openDatabase(path, version: 1, onCreate: (db, version){


       //Creating Expense Table
       db.execute('create table $EXPENSE_TABLE ( '
           '$EXPENSE_COLUM_ID integer primary key autoincrement, '
           '$EXPENSE_COLUM_TITLE text, '
           '$EXPENSE_COLUM_DESC text, '
           '$EXPENSE_COLUM_AMT integer,'
           '$EXPENSE_COLUM_CAT_ID integer,'
           '$EXPENSE_COLUM_ECPENSE_TYPE integer,'
           '$EXPENSE_COLUM_TIME text)');


       //Creating Categary table
       db.execute('create table $CAT_TABLE ( '
           '$CAT_COLUM_ID integer primary key autoincrement, '
           '$CAT_COLUM_NAME text, '
           '$CAT_COULM_PATH text,)');


       db.insert(CAT_TABLE, CatModel(name: 'Travel', imgPath: 'assets/images/expense_type/travel.png').toMap());
       db.insert(CAT_TABLE, {CAT_COLUM_NAME : 'Snacks', CAT_COULM_PATH : 'assets/images/expense_type/snack.png'});
       db.insert(CAT_TABLE, {CAT_COLUM_NAME : 'coffee', CAT_COULM_PATH : 'assets/images/expense_type/coffee.png'});
       db.insert(CAT_TABLE, {CAT_COLUM_NAME : 'fast-food', CAT_COULM_PATH : 'assets/images/expense_type/fast-food.png'});
       db.insert(CAT_TABLE, {CAT_COLUM_NAME : 'gift-box', CAT_COULM_PATH : 'assets/images/expense_type/gift-box.png'});
       db.insert(CAT_TABLE, {CAT_COLUM_NAME : 'hawaiian-shirt', CAT_COULM_PATH : 'assets/images/expense_type/hawaiian-shirt.png'});
       db.insert(CAT_TABLE, {CAT_COLUM_NAME : 'hot-pot', CAT_COULM_PATH : 'assets/images/expense_type/hot-pot.png'});
       db.insert(CAT_TABLE, {CAT_COLUM_NAME : 'makeup-pouch', CAT_COULM_PATH : 'assets/images/expense_type/makeup-pouch.png'});
       db.insert(CAT_TABLE, {CAT_COLUM_NAME : 'mobile-transfer', CAT_COULM_PATH : 'assets/images/expense_type/mobile-transfer.png'});
       db.insert(CAT_TABLE, {CAT_COLUM_NAME : 'music', CAT_COULM_PATH : 'assets/images/expense_type/music.png'});
       db.insert(CAT_TABLE, {CAT_COLUM_NAME : 'popcorn', CAT_COULM_PATH : 'assets/images/expense_type/popcorn.png'});
       db.insert(CAT_TABLE, {CAT_COLUM_NAME : 'restaurant', CAT_COULM_PATH : 'assets/images/expense_type/restaurant.png'});


     });
  }


  Future<bool> addExpense (ExpenseModel expense) async {
    var myDB = await openDB();
    return await myDB.insert(EXPENSE_TABLE, expense.toMap()
        /*{EXPENSE_COLUM_TITLE : expense.title,
         EXPENSE_COLUM_DESC : expense.desc,
         EXPENSE_COLUM_AMT : expense.amt,
         EXPENSE_COLUM_CAT_ID : expense.catId,
         EXPENSE_COLUM_ECPENSE_TYPE : expense.expenseType,
         EXPENSE_COLUM_TIME : expense.time}*/

         )>0;

  }

  Future<List<ExpenseModel>> fetchData() async {
    var myDB = await openDB();

    List<Map<String, dynamic>> data;

    data = await myDB.query(EXPENSE_TABLE);

    List<ExpenseModel> arrExpense = [];

    for(Map<String, dynamic>expense in data){

      /*ExpenseModel model = ExpenseModel();

      model.eid = expense[EXPENSE_COLUM_ID];
      model.title = expense[EXPENSE_COLUM_TITLE];
      model.desc = expense[EXPENSE_COLUM_DESC];
      model.amt = expense[EXPENSE_COLUM_AMT];
      model.catId = expense[EXPENSE_COLUM_CAT_ID];
      model.expenseType = expense[EXPENSE_COLUM_ECPENSE_TYPE];
      model.time = expense[EXPENSE_COLUM_TIME];*/

      arrExpense.add(ExpenseModel.formMap(expense));

    }

    return arrExpense;
  }


}