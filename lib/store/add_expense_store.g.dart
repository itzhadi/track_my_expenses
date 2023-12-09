// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_expense_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddExpensesStore on _AddExpensesStore, Store {
  Computed<bool>? _$getIsExpenseComputed;

  @override
  bool get getIsExpense =>
      (_$getIsExpenseComputed ??= Computed<bool>(() => super.getIsExpense,
              name: '_AddExpensesStore.getIsExpense'))
          .value;
  Computed<bool>? _$getIsPermanentComputed;

  @override
  bool get getIsPermanent =>
      (_$getIsPermanentComputed ??= Computed<bool>(() => super.getIsPermanent,
              name: '_AddExpensesStore.getIsPermanent'))
          .value;
  Computed<dynamic>? _$descriptionControllerComputed;

  @override
  dynamic get descriptionController => (_$descriptionControllerComputed ??=
          Computed<dynamic>(() => super.descriptionController,
              name: '_AddExpensesStore.descriptionController'))
      .value;
  Computed<dynamic>? _$amountControllerComputed;

  @override
  dynamic get amountController => (_$amountControllerComputed ??=
          Computed<dynamic>(() => super.amountController,
              name: '_AddExpensesStore.amountController'))
      .value;

  late final _$_isExpenseAtom =
      Atom(name: '_AddExpensesStore._isExpense', context: context);

  @override
  bool get _isExpense {
    _$_isExpenseAtom.reportRead();
    return super._isExpense;
  }

  @override
  set _isExpense(bool value) {
    _$_isExpenseAtom.reportWrite(value, super._isExpense, () {
      super._isExpense = value;
    });
  }

  late final _$_isPermanentAtom =
      Atom(name: '_AddExpensesStore._isPermanent', context: context);

  @override
  bool get _isPermanent {
    _$_isPermanentAtom.reportRead();
    return super._isPermanent;
  }

  @override
  set _isPermanent(bool value) {
    _$_isPermanentAtom.reportWrite(value, super._isPermanent, () {
      super._isPermanent = value;
    });
  }

  late final _$isPermanentToggleTextAtom =
      Atom(name: '_AddExpensesStore.isPermanentToggleText', context: context);

  @override
  String get isPermanentToggleText {
    _$isPermanentToggleTextAtom.reportRead();
    return super.isPermanentToggleText;
  }

  @override
  set isPermanentToggleText(String value) {
    _$isPermanentToggleTextAtom.reportWrite(value, super.isPermanentToggleText,
        () {
      super.isPermanentToggleText = value;
    });
  }

  late final _$_descriptionControllerAtom =
      Atom(name: '_AddExpensesStore._descriptionController', context: context);

  @override
  TextEditingController get _descriptionController {
    _$_descriptionControllerAtom.reportRead();
    return super._descriptionController;
  }

  @override
  set _descriptionController(TextEditingController value) {
    _$_descriptionControllerAtom
        .reportWrite(value, super._descriptionController, () {
      super._descriptionController = value;
    });
  }

  late final _$_amountControllerAtom =
      Atom(name: '_AddExpensesStore._amountController', context: context);

  @override
  TextEditingController get _amountController {
    _$_amountControllerAtom.reportRead();
    return super._amountController;
  }

  @override
  set _amountController(TextEditingController value) {
    _$_amountControllerAtom.reportWrite(value, super._amountController, () {
      super._amountController = value;
    });
  }

  late final _$itemDateAtom =
      Atom(name: '_AddExpensesStore.itemDate', context: context);

  @override
  DateTime? get itemDate {
    _$itemDateAtom.reportRead();
    return super.itemDate;
  }

  @override
  set itemDate(DateTime? value) {
    _$itemDateAtom.reportWrite(value, super.itemDate, () {
      super.itemDate = value;
    });
  }

  late final _$_AddExpensesStoreActionController =
      ActionController(name: '_AddExpensesStore', context: context);

  @override
  void setItemDate(DateTime date) {
    final _$actionInfo = _$_AddExpensesStoreActionController.startAction(
        name: '_AddExpensesStore.setItemDate');
    try {
      return super.setItemDate(date);
    } finally {
      _$_AddExpensesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleIsExpense() {
    final _$actionInfo = _$_AddExpensesStoreActionController.startAction(
        name: '_AddExpensesStore.toggleIsExpense');
    try {
      return super.toggleIsExpense();
    } finally {
      _$_AddExpensesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleIsPermanent(int index) {
    final _$actionInfo = _$_AddExpensesStoreActionController.startAction(
        name: '_AddExpensesStore.toggleIsPermanent');
    try {
      return super.toggleIsPermanent(index);
    } finally {
      _$_AddExpensesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPermanentToggleText: ${isPermanentToggleText},
itemDate: ${itemDate},
getIsExpense: ${getIsExpense},
getIsPermanent: ${getIsPermanent},
descriptionController: ${descriptionController},
amountController: ${amountController}
    ''';
  }
}
