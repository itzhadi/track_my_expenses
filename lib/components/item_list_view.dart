import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:track_my_expenses/components/item_tile.dart';
import 'package:track_my_expenses/store/item_list.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ItemList>(context);
    return Flexible(
      child: Observer(
        builder: (_) => ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: list.visibleItems.length,
          itemBuilder: (_, index) {
            final item = list.visibleItems[index];
            return Observer(
                builder: (_) => ItemTile(
                      description: item.description,
                      amount: item.amount,
                      date: item.date,
                      isExpense: item.isExpense,
                      isPermanent: item.isPermanent,
                    ));
          },
        ),
      ),
    );
  }
}