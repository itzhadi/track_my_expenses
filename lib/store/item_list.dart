import 'package:mobx/mobx.dart';
import 'package:track_my_expenses/store/item_model.dart';

part 'item_list.g.dart';

enum VisibilityFilter { all, expenses, incomes }

class ItemList = _ItemList with _$ItemList;

abstract class _ItemList with Store {
  @observable
  ObservableList<ItemModel> items = ObservableList<ItemModel>();

  @observable
  VisibilityFilter filter = VisibilityFilter.all;

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
      bool isPermanent) {
    ItemModel item =
        ItemModel(desc, amount.toString(), date, isExpense, isPermanent);
    items.add(item);
  }

  @action
  void removeItem(ItemModel item) {
    items.removeWhere((x) => x == item);
  }

  @action
  void changeFilter(VisibilityFilter filter) => this.filter = filter;
}
