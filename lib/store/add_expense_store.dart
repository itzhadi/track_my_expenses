import 'dart:ui';

import 'package:flutter/cupertino.dart';
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

  @observable
  TextEditingController _descriptionController = TextEditingController();

  @observable
  TextEditingController _amountController = TextEditingController();

  @observable
  DateTime? itemDate = DateTime.now();

  @computed
  bool get getIsExpense => _isExpense;

  @computed
  bool get getIsPermanent => _isPermanent;

  @computed
  get descriptionController => _descriptionController;

  @computed
  get amountController => _amountController;

  @action
  void setItemDate(DateTime date) {
    itemDate = date;
  }

  void calculateIsPermanentToggleText() {
    isPermanentToggleText = _isPermanent ? "קבוע" : "חד פעמי";
  }

  @action
  void toggleIsExpense() {
    _isExpense = !_isExpense;
    _isExpense ? print("הוצאה") : print("הכנסה");
  }

  @action
  void toggleIsPermanent(int index) {
    _isPermanent = index == 1 ? true : false;
  }

  void clearControllers() {
    _descriptionController.clear();
    _amountController.clear();
  }

  void initializeValues() {
    _isExpense = true;
    _isPermanent = false;
  }
}
