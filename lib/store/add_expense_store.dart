import 'dart:ui';

import 'package:mobx/mobx.dart';

import '../utils/colors.dart';

part 'add_expense_store.g.dart';

class AddExpensesStore = _AddExpensesStore with _$AddExpensesStore;

abstract class _AddExpensesStore with Store {
  _AddExpensesStore() {
    reaction((_) => _isPermanent, (bool) {
      calculateIsPermanentToggleText();
    });
  }

  @observable
  bool _isExpense = true;

  @observable
  bool _isPermanent = false;

  @observable
  String isPermanentToggleText = "חד פעמי";

  @action
  void toggleIsExpense() {
    _isExpense = !_isExpense;
    _isExpense ? print("הוצאה") : print("הכנסה");
  }

  @computed
  bool get getIsExpense => _isExpense;

  @action
  void toggleIsPermanent(int index) {
    _isPermanent = index == 1 ? true : false;
  }

  @computed
  bool get getIsPermanent => _isPermanent;

  void calculateIsPermanentToggleText() {
    isPermanentToggleText = _isPermanent ? "קבוע" : "חד פעמי";
  }

  void initializeValues() {
    _isExpense = true;
    _isPermanent = false;
  }
}
