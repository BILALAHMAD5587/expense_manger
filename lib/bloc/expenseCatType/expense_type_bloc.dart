import 'package:bloc/bloc.dart';
import 'package:expenser_app/models/cat_model.dart';
import 'package:meta/meta.dart';

import '../../ui/custom_widgets/db_helper.dart';
part 'expense_type_event.dart';
part 'expense_type_state.dart';

class ExpenseTypeBloc extends Bloc<ExpenseTypeEvent, ExpenseTypeState> {
  ExpenseTypeBloc() : super(ExpenseTypeInitialState()) {
    on<FetchAllCatExpenseType>((event, emit) async {

      emit(ExpenseTypeLoadingState());
      var arrExpenseType = await DBHelper().fetchAllCat();
      emit(ExpenseTypeLoadedState(arrExpenseType));
    });
  }
}
