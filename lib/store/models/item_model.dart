import 'package:mobx/mobx.dart';

part 'item_model.g.dart';

class ItemModel = _ItemModel with _$ItemModel;

abstract class _ItemModel with Store {
  _ItemModel(this.description, this.amount, this.date, this.isExpense);

  @observable
  String? description;

  @observable
  String? amount;

  @observable
  DateTime? date;

  @observable
  bool? isExpense = true;
}
