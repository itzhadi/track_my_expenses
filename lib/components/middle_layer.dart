import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_my_expenses/screens/home_screen.dart';
import 'package:track_my_expenses/store/add_expense_store.dart';
import 'package:track_my_expenses/utils/colors.dart';

import '../store/item_list.dart';

class MiddleLayer extends StatefulWidget {
  const MiddleLayer({super.key});

  @override
  State<MiddleLayer> createState() => _MiddleLayerState();
}

class _MiddleLayerState extends State<MiddleLayer> {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<ItemList>(create: (_) => ItemList()),
          Provider(create: (_) => AddExpensesStore())
        ],
        child: Container(
          color: main_color,
          child: SafeArea(child: HomeScreen()),
        ),
      );
}
