part of 'expense_type_bloc.dart';

@immutable
abstract class ExpenseTypeState {}

class ExpenseTypeInitialState extends ExpenseTypeState {}


class ExpenseTypeLoadingState extends ExpenseTypeState{}


class ExpenseTypeLoadedState extends ExpenseTypeState{
  List<CatModel> arrExpenseType;
  ExpenseTypeLoadedState(this.arrExpenseType);
}

class ExpeseTypeErrorState extends ExpenseTypeState{
  String errorMsg;
  ExpeseTypeErrorState(this.errorMsg);
}
