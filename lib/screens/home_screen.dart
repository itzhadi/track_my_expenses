import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:track_my_expenses/screens/history_screen.dart';
import 'package:track_my_expenses/store/item_list.dart';
import 'package:track_my_expenses/store/item_model.dart';
import 'package:track_my_expenses/utils/colors.dart';
import 'add_expense_screen.dart';
import 'expenses_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ReactionDisposer>? _disposers;
  int selectedPage = 0;
  final _pageNo = [Expenses(), AddExpense(), History(), History()];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final listStor = Provider.of<ItemList>(context);
    _disposers = [
      reaction((_) => listStor.items,
          (ObservableList) => listStor.sortListByPerAndDate())
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _disposers!.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ItemList>(context);
    return Scaffold(
      body: _pageNo[selectedPage],
      bottomNavigationBar: Container(
        child: ConvexAppBar(
          color: Colors.white60,
          activeColor: Colors.white60,
          top: 0,
          backgroundColor: main_color,
          initialActiveIndex: 0,
          items: [
            TabItem(icon: Icons.home),
            TabItem(
                icon: Icons.add_rounded,
                title: 'הוסף',
                fontFamily: 'BebasNeue'),
            TabItem(icon: Icons.history, title: 'היסטוריה'),
            TabItem(icon: Icons.stacked_bar_chart, title: 'סטטיסטיקה')
          ],
          onTap: (int i) {
            setState(
              () {
                selectedPage = i;
                if (selectedPage == 0 && list.showSearch) {
                  list.toggleShowSearch();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
