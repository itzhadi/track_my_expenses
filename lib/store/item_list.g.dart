// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemList on _ItemList, Store {
  Computed<ObservableList<ItemModel>>? _$searchedItemsComputed;

  @override
  ObservableList<ItemModel> get searchedItems => (_$searchedItemsComputed ??=
          Computed<ObservableList<ItemModel>>(() => super.searchedItems,
              name: '_ItemList.searchedItems'))
      .value;
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
  Computed<int>? _$balanceComputed;

  @override
  int get balance => (_$balanceComputed ??=
          Computed<int>(() => super.balance, name: '_ItemList.balance'))
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

  late final _$totalIncomesAtom =
      Atom(name: '_ItemList.totalIncomes', context: context);

  @override
  int get totalIncomes {
    _$totalIncomesAtom.reportRead();
    return super.totalIncomes;
  }

  @override
  set totalIncomes(int value) {
    _$totalIncomesAtom.reportWrite(value, super.totalIncomes, () {
      super.totalIncomes = value;
    });
  }

  late final _$totalExpensesAtom =
      Atom(name: '_ItemList.totalExpenses', context: context);

  @override
  int get totalExpenses {
    _$totalExpensesAtom.reportRead();
    return super.totalExpenses;
  }

  @override
  set totalExpenses(int value) {
    _$totalExpensesAtom.reportWrite(value, super.totalExpenses, () {
      super.totalExpenses = value;
    });
  }

  late final _$showSearchAtom =
      Atom(name: '_ItemList.showSearch', context: context);

  @override
  bool get showSearch {
    _$showSearchAtom.reportRead();
    return super.showSearch;
  }

  @override
  set showSearch(bool value) {
    _$showSearchAtom.reportWrite(value, super.showSearch, () {
      super.showSearch = value;
    });
  }

  late final _$showActionsBarAtom =
      Atom(name: '_ItemList.showActionsBar', context: context);

  @override
  bool get showActionsBar {
    _$showActionsBarAtom.reportRead();
    return super.showActionsBar;
  }

  @override
  set showActionsBar(bool value) {
    _$showActionsBarAtom.reportWrite(value, super.showActionsBar, () {
      super.showActionsBar = value;
    });
  }

  late final _$_startDateAtom =
      Atom(name: '_ItemList._startDate', context: context);

  @override
  DateTime? get _startDate {
    _$_startDateAtom.reportRead();
    return super._startDate;
  }

  @override
  set _startDate(DateTime? value) {
    _$_startDateAtom.reportWrite(value, super._startDate, () {
      super._startDate = value;
    });
  }

  late final _$_endDateAtom =
      Atom(name: '_ItemList._endDate', context: context);

  @override
  DateTime? get _endDate {
    _$_endDateAtom.reportRead();
    return super._endDate;
  }

  @override
  set _endDate(DateTime? value) {
    _$_endDateAtom.reportWrite(value, super._endDate, () {
      super._endDate = value;
    });
  }

  late final _$_searchItemAtom =
      Atom(name: '_ItemList._searchItem', context: context);

  @override
  String get _searchItem {
    _$_searchItemAtom.reportRead();
    return super._searchItem;
  }

  @override
  set _searchItem(String value) {
    _$_searchItemAtom.reportWrite(value, super._searchItem, () {
      super._searchItem = value;
    });
  }

  late final _$_showDateRangeAtom =
      Atom(name: '_ItemList._showDateRange', context: context);

  @override
  bool get _showDateRange {
    _$_showDateRangeAtom.reportRead();
    return super._showDateRange;
  }

  @override
  set _showDateRange(bool value) {
    _$_showDateRangeAtom.reportWrite(value, super._showDateRange, () {
      super._showDateRange = value;
    });
  }

  late final _$_ItemListActionController =
      ActionController(name: '_ItemList', context: context);

  @override
  void calculateIncomes() {
    final _$actionInfo = _$_ItemListActionController.startAction(
        name: '_ItemList.calculateIncomes');
    try {
      return super.calculateIncomes();
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateExpenses() {
    final _$actionInfo = _$_ItemListActionController.startAction(
        name: '_ItemList.calculateExpenses');
    try {
      return super.calculateExpenses();
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

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
  void addItemModel(String desc, int amount, DateTime date, bool isExpense,
      bool isPermanent, Key key) {
    final _$actionInfo =
        _$_ItemListActionController.startAction(name: '_ItemList.addItemModel');
    try {
      return super
          .addItemModel(desc, amount, date, isExpense, isPermanent, key);
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
  void removeAllItems() {
    final _$actionInfo = _$_ItemListActionController.startAction(
        name: '_ItemList.removeAllItems');
    try {
      return super.removeAllItems();
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
  void sortListByPerAndDate() {
    final _$actionInfo = _$_ItemListActionController.startAction(
        name: '_ItemList.sortListByPerAndDate');
    try {
      return super.sortListByPerAndDate();
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowSearch() {
    final _$actionInfo = _$_ItemListActionController.startAction(
        name: '_ItemList.toggleShowSearch');
    try {
      return super.toggleShowSearch();
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowDateRange(bool isToshowDateRange) {
    final _$actionInfo = _$_ItemListActionController.startAction(
        name: '_ItemList.toggleShowDateRange');
    try {
      return super.toggleShowDateRange(isToshowDateRange);
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSerchItem(String text) {
    final _$actionInfo =
        _$_ItemListActionController.startAction(name: '_ItemList.setSerchItem');
    try {
      return super.setSerchItem(text);
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStartEndDate(DateTimeRange result) {
    final _$actionInfo = _$_ItemListActionController.startAction(
        name: '_ItemList.setStartEndDate');
    try {
      return super.setStartEndDate(result);
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tooglePinItem(Key key) {
    final _$actionInfo = _$_ItemListActionController.startAction(
        name: '_ItemList.tooglePinItem');
    try {
      return super.tooglePinItem(key);
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateItem(String desc, String amount, DateTime date, Key key) {
    final _$actionInfo =
        _$_ItemListActionController.startAction(name: '_ItemList.updateItem');
    try {
      return super.updateItem(desc, amount, date, key);
    } finally {
      _$_ItemListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
filter: ${filter},
totalIncomes: ${totalIncomes},
totalExpenses: ${totalExpenses},
showSearch: ${showSearch},
showActionsBar: ${showActionsBar},
searchedItems: ${searchedItems},
expensesOnly: ${expensesOnly},
incomesOnly: ${incomesOnly},
hasExpenses: ${hasExpenses},
hasIncomes: ${hasIncomes},
visibleItems: ${visibleItems},
balance: ${balance}
    ''';
  }
}
