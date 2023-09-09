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

  late final _$_AddExpensesStoreActionController =
      ActionController(name: '_AddExpensesStore', context: context);

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
getIsExpense: ${getIsExpense},
getIsPermanent: ${getIsPermanent}
    ''';
  }
}
