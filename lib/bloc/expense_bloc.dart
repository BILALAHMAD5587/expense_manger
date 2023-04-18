import 'package:bloc/bloc.dart';
import 'package:expenser_app/models/expense_model.dart';
import 'package:expenser_app/ui/custom_widgets/db_helper.dart';
import 'package:meta/meta.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseInitialState()) {
    on<NewExpenseEvent>((event, emit) async {
     emit(ExpenseLoadingState());
    if( await DBHelper().addExpense(event.newExpense)){
     var arrExpense = await DBHelper().fetchData();
     emit(ExpenseLoadedState(arrExpense));
    } else {
      emit(ExpeseErrorState('Expense not Added!!'));
    }
    });

    on<FetchExpenseEvent>((event, emit)async {

      emit(ExpenseLoadingState());
      var arrExpense = await DBHelper().fetchData();
      emit(ExpenseLoadedState(arrExpense));
    });


  }
}


