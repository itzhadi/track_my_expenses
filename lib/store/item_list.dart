import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:track_my_expenses/store/item_model.dart';

import '../utils/helper_functions.dart';

part 'item_list.g.dart';

enum VisibilityFilter { all, expenses, incomes }

class ItemList = _ItemList with _$ItemList;

abstract class _ItemList with Store {
  @observable
  ObservableList<ItemModel> items = ObservableList<ItemModel>();

  @observable
  VisibilityFilter filter = VisibilityFilter.all;

  @observable
  int totalIncomes = 0;

  @observable
  int totalExpenses = 0;

  @observable
  bool showSearch = false;

  @observable
  bool showActionsBar = true;

  @observable
  DateTime? _startDate;

  @observable
  DateTime? _endDate;

  @observable
  String _searchItem = '';

  @observable
  bool _showDateRange = false;

  @observable
  String _currentMonth = '';

  @computed
  ObservableList<ItemModel> get searchedItems {
    if (_searchItem.isEmpty && (_endDate == null && _startDate == null)) {
      return items;
    } else {
      List<ItemModel> itemList = items
          .where((item) =>
              (_searchItem.isEmpty ||
                  item.description!
                      .toLowerCase()
                      .contains(_searchItem.toLowerCase()) ||
                  item.amount!.contains(_searchItem)) &&
              ((_startDate == null ||
                      item.date!.isAfter(_startDate!) ||
                      item.date!.isAtSameMomentAs(_startDate!)) &&
                  (_endDate == null ||
                      item.date!.isBefore(_endDate!) ||
                      item.date!.isAtSameMomentAs(_endDate!))))
          .toList();

      // if (_endDate != null && _startDate != null) {
      //   calculateExpensesAfterDateRange(itemList);
      // }
      return ObservableList<ItemModel>.of(itemList);
    }
  }

  @computed
  ObservableList<ItemModel> get expensesOnly =>
      ObservableList.of(items.where((item) => item.isExpense == true));

  @computed
  ObservableList<ItemModel> get incomesOnly =>
      ObservableList.of(items.where((item) => item.isExpense != true));

  @computed
  bool get hasExpenses => expensesOnly.isNotEmpty;

  @computed
  bool get hasIncomes => incomesOnly.isNotEmpty;

  @computed
  ObservableList<ItemModel> get visibleItems {
    switch (filter) {
      case VisibilityFilter.expenses:
        return expensesOnly;
      case VisibilityFilter.incomes:
        return incomesOnly;
      default:
        return items;
    }
  }

  @action
  void calculateIncomes() {
    int sum = 0;
    incomesOnly.forEach((element) {
      sum += int.parse(element.amount!);
    });
    totalIncomes = sum;
  }

  @action
  void calculateExpenses() {
    int sum = 0;
    expensesOnly.forEach((element) {
      sum += int.parse(element.amount!);
    });
    totalExpenses = sum;
  }

  @computed
  int get balance => totalIncomes - totalExpenses;

  @action
  ObservableList<ItemModel> serchedItemListByAmount(int amount) =>
      ObservableList.of(items
          .where((item) => item.amount?.contains(amount.toString()) == true));

  @action
  ObservableList<ItemModel> serchedItemListDesc(String desc) =>
      ObservableList.of(
          items.where((item) => item.description?.contains(desc) == true));

  @action
  ObservableList<ItemModel> serchedItemListDate(DateTime dateTime) =>
      ObservableList.of(
          items.where((item) => item.date?.compareTo(dateTime) == true));

  @action
  void addItemModel(String desc, int amount, DateTime date, bool isExpense,
      bool isPermanent, Key key) {
    isExpense ? totalExpenses += amount : totalIncomes += amount;
    ItemModel item =
        ItemModel(desc, amount.toString(), date, isExpense, isPermanent, key);
    items.add(item);
    sortListByPerAndDate();
  }

  @action
  void removeItem(ItemModel item) {
    items.removeWhere((x) => x == item);
    item.isExpense! ? calculateExpenses() : calculateIncomes();
    sortListByPerAndDate();
  }

  @action
  void removeAllItems() {
    items.clear();
    setStartEndDate(DateTimeRange(start: DateTime(1900), end: DateTime(1900)));
    calculateExpenses();
    calculateIncomes();
  }

  @action
  void changeFilter(VisibilityFilter filter) => this.filter = filter;

  //ToDo action reaction
  @action
  void sortListByPerAndDate() {
    items.sort((a, b) {
      if (a.isPermanent && !b.isPermanent) {
        return -1;
      } else if (!a.isPermanent && b.isPermanent) {
        return 1;
      }
      return a.date!.compareTo(b.date!);
    });
  }

  @action
  void toggleShowSearch() {
    showSearch = !showSearch;
    showActionsBar = !showActionsBar;
    _searchItem = '';
  }

  @action
  void toggleShowDateRange(bool isToshowDateRange) {
    _showDateRange = isToshowDateRange;
  }

  bool? get getShowDateRange => _showDateRange;

  @action
  void setSerchItem(String text) {
    _searchItem = text;
  }

  @action
  void setCurrentMonth(DateTime currentDate) {
    _currentMonth = getMontheName(currentDate.month);
  }

  @action
  get getCurrentMonthName => _currentMonth;

  @action
  void setStartEndDate(DateTimeRange result) {
    _startDate = result.start.isAfter(DateTime(1900)) ? result.start : null;
    _endDate = result.end.isAfter(DateTime(1900)) ? result.end : null;
  }

  @action
  void tooglePinItem(Key key) {
    ItemModel item = getItemByKey(key);
    item.isPermanent = !item.isPermanent;
    sortListByPerAndDate();
  }

  @action
  void updateItem(String desc, String amount, DateTime date, Key key) {
    ItemModel item = getItemByKey(key);
    item.description = desc;
    item.amount = amount;
    item.date = date;
    item.isExpense! ? calculateExpenses() : calculateIncomes();

    sortListByPerAndDate();
  }

  ItemModel getItemByKey(Key key) =>
      items.firstWhere((item) => item.key == key);

  String? get dayEndDate => _endDate != null
      ? _endDate?.day?.toString()
      : DateTime(1900).day.toString();

  String? get dayStartDate => _startDate != null
      ? _startDate?.day?.toString()
      : DateTime(1900).day.toString();

  ObservableList<ItemModel> getExpenses(List<ItemModel> itemList) =>
      ObservableList.of(itemList.where((item) => item.isExpense == true));

  @action
  void calculateExpensesAfterDateRange(List<ItemModel> itemList) {
    int sum = 0;
    Iterable<ItemModel> itemListExpense = getExpenses(itemList);
    itemListExpense.forEach((element) {
      sum += int.parse(element.amount!);
    });
    totalExpenses = sum;
  }

  getMontheName(int monthNumber) {
    print("getMonthe");
    DateTime date = DateTime(DateTime.now().year, monthNumber);
    return DateFormat('MMMM', 'he_IL').format(date);
  }
}
