// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemList on _ItemList, Store {
  Computed<ObservableList<ItemModel>>? _$expensesOnlyComputed;

  @override
  ObservableList<ItemModel> get expensesOnly => (_$expensesOnlyComputed ??=
          Computed<ObservableList<ItemModel>>(() => super.expensesOnly,
              name: '_ItemList.expensesOnly'))
      .value;
  Computed<ObservableList<ItemModel>>? _$incomesOnlyComputed;

  @override
  ObservableList<ItemModel> get incomesOnly => (_$incomesOnlyComputed ??=
          Computed<ObservableList<ItemModel>>(() => super.incomesOnly,
              name: '_ItemList.incomesOnly'))
      .value;
  Computed<bool>? _$hasExpensesComputed;

  @override
  bool get hasExpenses =>
      (_$hasExpensesComputed ??= Computed<bool>(() => super.hasExpenses,
              name: '_ItemList.hasExpenses'))
          .value;
  Computed<bool>? _$hasIncomesComputed;

  @override
  bool get hasIncomes => (_$hasIncomesComputed ??=
          Computed<bool>(() => super.hasIncomes, name: '_ItemList.hasIncomes'))
      .value;
  Computed<ObservableList<ItemModel>>? _$visibleItemsComputed;

  @override
  ObservableList<ItemModel> get visibleItems => (_$visibleItemsComputed ??=
          Computed<ObservableList<ItemModel>>(() => super.visibleItems,
              name: '_ItemList.visibleItems'))
      .value;

  late final _$itemsAtom = Atom(name: '_ItemList.items', context: context);

  @override
  ObservableList<ItemModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<ItemModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$filterAtom = Atom(name: '_ItemList.filter', context: context);

  @override
  VisibilityFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(VisibilityFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$_ItemListActionController =
      ActionController(name: '_ItemList', context: context);

  @override
  ObservableList<ItemModel> serchedItemListByAmount(int amount) {
    final _$actionInfo = _$_ItemListActionController.startAction(
        name: '_ItemList.serchedItemListByAmount');
    try {
      return super.serchedItemListByAmount(amount);
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableList<ItemModel> serchedItemListDesc(String desc) {
    final _$actionInfo = _$_ItemListActionController.startAction(
        name: '_ItemList.serchedItemListDesc');
    try {
      return super.serchedItemListDesc(desc);
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableList<ItemModel> serchedItemListDate(DateTime dateTime) {
    final _$actionInfo = _$_ItemListActionController.startAction(
        name: '_ItemList.serchedItemListDate');
    try {
      return super.serchedItemListDate(dateTime);
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItemModel(String desc, int amount, DateTime date, bool isExpense) {
    final _$actionInfo =
        _$_ItemListActionController.startAction(name: '_ItemList.addItemModel');
    try {
      return super.addItemModel(desc, amount, date, isExpense);
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(ItemModel item) {
    final _$actionInfo =
        _$_ItemListActionController.startAction(name: '_ItemList.removeItem');
    try {
      return super.removeItem(item);
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFilter(VisibilityFilter filter) {
    final _$actionInfo =
        _$_ItemListActionController.startAction(name: '_ItemList.changeFilter');
    try {
      return super.changeFilter(filter);
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
filter: ${filter},
expensesOnly: ${expensesOnly},
incomesOnly: ${incomesOnly},
hasExpenses: ${hasExpenses},
hasIncomes: ${hasIncomes},
visibleItems: ${visibleItems}
    ''';
  }
}