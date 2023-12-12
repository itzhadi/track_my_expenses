import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:track_my_expenses/store/item_model.dart';

import '../utils/helper_functions.dart';

part 'item_list.g.dart';

enum VisibilityFilter { all, expenses, incomes }

class ItemList = _ItemList with _$ItemList;

abstract class _ItemList with Store {
  _ItemList() {
    reaction((_) => _endDate, (DateTime) {
      calculateExpensesAndResponsesAfterDateRange();
    });
  }

  @observable
  ObservableList<ItemModel> items = ObservableList<ItemModel>();

  @observable
  VisibilityFilter filter = VisibilityFilter.all;

  @observable
  int _totalIncomes = 0;

  @observable
  int _totalExpenses = 0;

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

  @observable
  int currentYear = DateTime.now().year;

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

      return ObservableList<ItemModel>.of(itemList);
    }
  }

  @computed
  int get getTotalExpenses => _totalExpenses;

  @computed
  int get getTotalIncomes => _totalIncomes;

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

  DateTime? get getEndDate => _endDate;

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
      if (getMontheName(element.date!.month) == _currentMonth) {
        sum += int.parse(element.amount!);
      }
    });
    _totalIncomes = sum;
  }

  @action
  void calculateExpenses() {
    int sum = 0;
    expensesOnly.forEach((element) {
      if (getMontheName(element.date!.month) == _currentMonth) {
        sum += int.parse(element.amount!);
      }
    });
    _totalExpenses = sum;
  }

  @computed
  int get balance => _totalIncomes - _totalExpenses;

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
    //isExpense ? _totalExpenses += amount : _totalIncomes += amount;
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
    items.removeWhere(
        (element) => getMontheName(element.date!.month) == _currentMonth);
    int targetMonth = HelperFunctions.getMonthNumber(_currentMonth);
    setStartEndDateRange(DateTimeRange(
        start: DateTime(currentYear, targetMonth, 1),
        end: DateTime(currentYear, targetMonth + 1, 0)));
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
    currentYear = currentDate.year;
  }

  get getCurrentMonthName => _currentMonth;

  @action
  void setStartEndDateRange(DateTimeRange result) {
    _startDate = result.start.isAfter(DateTime(1900)) ? result.start : null;
    _endDate = result.end.isAfter(DateTime(1900)) ? result.end : null;
  }

  @action
  void setStartEndDates(DateTime firstDayOfMonth, DateTime lastDayOfMonth) {
    _startDate = firstDayOfMonth;
    _endDate = lastDayOfMonth;
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

  ObservableList<ItemModel> getIncomes(List<ItemModel> itemList) =>
      ObservableList.of(itemList.where((item) => item.isExpense != true));

  List<ItemModel> getItemListAfterDateRange() {
    List<ItemModel> itemList = items
        .where((item) => ((_startDate == null ||
                item.date!.isAfter(_startDate!) ||
                item.date!.isAtSameMomentAs(_startDate!)) &&
            (_endDate == null ||
                item.date!.isBefore(_endDate!) ||
                item.date!.isAtSameMomentAs(_endDate!))))
        .toList();

    return itemList;
  }

  @action
  void calculateExpensesAndResponsesAfterDateRange() {
    List<ItemModel> itemList = getItemListAfterDateRange();
    Iterable<ItemModel> itemListExpense = getExpenses(itemList);
    Iterable<ItemModel> itemListIncomes = getIncomes(itemList);
    calculateExpensesAfterDateRange(itemListExpense);
    calculateIncomesAfterDateRange(itemListIncomes);
  }

  void calculateExpensesAfterDateRange(Iterable<ItemModel> itemListExpense) {
    int totalExpensesSum = 0;
    itemListExpense.forEach((element) {
      totalExpensesSum += int.parse(element.amount!);
    });
    _totalExpenses = totalExpensesSum;
  }

  void calculateIncomesAfterDateRange(Iterable<ItemModel> itemListIncomes) {
    int totalIncomeSum = 0;
    for (var income in itemListIncomes) {
      totalIncomeSum += int.parse(income.amount!);
    }
    _totalIncomes = totalIncomeSum;
  }

  getMontheName(int monthNumber) {
    DateTime date = DateTime(DateTime.now().year, monthNumber);
    return DateFormat('MMMM', 'he_IL').format(date);
  }

  late final ReactionDisposer _reactionDisposer;

  void dispose() {
    _reactionDisposer();
  }
}
